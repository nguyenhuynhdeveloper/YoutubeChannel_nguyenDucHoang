import { Controller, Get, UseGuards, Req } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { Request } from "express";
import { MyJwtGuard } from 'src/authentication/guard';

@Controller('user')
export class UserController {
    //@UseGuards(AuthGuard('jwt'))
    @UseGuards(MyJwtGuard)
    @Get('me')
    ///user/me
    getMe(@Req() request: Request) {        
        //return 'This is user/me'
        //Guard will check the strategy before route handle
        return request.user
    }
}
