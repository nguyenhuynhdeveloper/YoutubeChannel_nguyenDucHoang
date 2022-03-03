import { Controller, Post, Req, Body } from "@nestjs/common";
import { AuthenticationService } from "./authentication.service";
import { Request } from "express";
import { AuthenticationDto } from "./dto";
@Controller('authentication')
export class AuthenticationController {
    constructor(private authenticationService: AuthenticationService){        
        
    }
    //endpoints
    //POST authentication/login
    @Post('login')
    login(@Body() dto: AuthenticationDto){
        return this.authenticationService.login(dto)        
    }
    @Post('register')
    /*
    register(@Req() request: Request){
        console.log(request.body) 
        //validations      
        return this.authenticationService.register()
    }
    */    
    register(
        @Body() dto: AuthenticationDto,
        // @Body('email') email: string, 
        // @Body('password') password: string
        ){
        console.log({dto}) 
        //console.log(`email = ${email}, password = ${password}`)
        //console.log(`email's type  = ${typeof email}, password's type = ${typeof password}`)
        //validations      

        return this.authenticationService.register(dto)
    }
}