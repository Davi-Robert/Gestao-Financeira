import { Controller, Get, Param } from '@nestjs/common';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
    constructor(private readonly authService: AuthService){}

    @Get('user/:email/:password')
    User(@Param() param: any): void{
        return this.authService.signin(param.email, param.password);
    }
}
