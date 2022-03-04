import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { PassportStrategy } from "@nestjs/passport";
import { ExtractJwt, Strategy } from "passport-jwt";
import { DatabaseService } from "src/database/database.service";

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
    constructor(private configService: ConfigService, private databaseService: DatabaseService) {
        super({
            jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
            secretOrKey:configService.get('JWT_SECRET_KEY')
        })
    }
    async validate(payload: {sub, email, iat }) {
        //payload = decoded object from bearer token
        console.log(`payload : ${JSON.stringify(payload)}`)
        debugger
        const user = await this.databaseService.user
            .findUnique({
                where: {
                    id: payload.sub
                }
            })
        delete user.hashPassword
        return user
    }
}