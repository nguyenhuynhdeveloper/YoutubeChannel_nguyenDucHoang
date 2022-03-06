import { Controller, Get, UseGuards, Req, Patch } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { Request } from "express";
import { GetUser } from 'src/authentication/decorator';
import { MyJwtGuard } from 'src/authentication/guard';
import {User} from '@prisma/client'
@Controller('user')
export class UserController {
    //@UseGuards(AuthGuard('jwt'))
    @UseGuards(MyJwtGuard)
    @Get('me')
    ///user/me 
    //getMe(@Req() request: Request) {                
    getMe(
        @GetUser() user : User,
        @GetUser('email') email : string //not neccessary
        ) {        
        //return 'This is user/me'
        //Guard will check the strategy before route handle
        console.log(`email = ${JSON.stringify(email)}`)
        return user
    }
    @Patch()
    editUser() {

    }
}
