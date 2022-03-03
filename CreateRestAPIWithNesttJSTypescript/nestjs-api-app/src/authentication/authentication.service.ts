import { ForbiddenException, Injectable } from "@nestjs/common";
import { DatabaseService } from "src/database/database.service";
import { AuthenticationDto } from "./dto";
import * as argon from 'argon2'
import { PrismaClientKnownRequestError } from "@prisma/client/runtime";
import { JwtService } from "@nestjs/jwt";
import { ConfigService } from "@nestjs/config";

@Injectable() //decorator
export class AuthenticationService {
    constructor(
        private databaseService: DatabaseService,
        private jwtService: JwtService,
        private configService: ConfigService
        ) {

    }
    async login(dto:AuthenticationDto){
        const user = await this.databaseService.user.findUnique(
            {
                where: {
                    email: dto.email
                }
            }
        );
        if(!user) throw new ForbiddenException('User does not exist')                
        const passwordIsMatch = await argon.verify(user.hashPassword, dto.password)
        if(!passwordIsMatch) {
            throw new ForbiddenException('Email/password is wrong')                
        }
        /*
        return {
            msg: 'This is Login'
        }
        */
       delete user.hashPassword
       //return user       
       return this.getToken(user.id, user.email)
    }
    async register(dto:AuthenticationDto){
        const hashPassword = await argon.hash(dto.password)
        debugger
        try {
            const user = await this.databaseService.user.create({
                data: {
                    email: dto.email,
                    hashPassword
                },
                select: {
                    id: true,
                    email: true,
                    firstName: true,
                    lastName: true
                }
            })
            /*
            return {
                msg: 'This is Register'
            }
            */
           //return user
           return this.getToken(user.id, user.email)
        }catch(error) {
            if(error instanceof PrismaClientKnownRequestError) {
                if(error.code == 'P2002') {
                    throw new ForbiddenException(`error credentials: ${error}`)
                }
            }
            throw error
        }        
    }
    async getToken(userId: number, email: string) {
        const token = await this.jwtService.signAsync({
            sub: userId,
            email
        }, {
            expiresIn: '15m',//15 minutes
            secret: this.configService.get('JWT_SECRET_KEY')
        })
        return {
            access_token: token
        }
    }
}