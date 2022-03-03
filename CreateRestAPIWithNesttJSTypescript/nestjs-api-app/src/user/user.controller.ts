import { Controller, Get, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';

@Controller('user')
export class UserController {
    @UseGuards(AuthGuard('jwt'))
    @Get('me')
    ///user/me
    getMe() {        
        return 'This is user/me'
        //Guard will check the strategy before route handle
    }
}
