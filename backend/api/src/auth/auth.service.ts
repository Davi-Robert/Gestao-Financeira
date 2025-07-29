import { Injectable } from '@nestjs/common';

@Injectable()
export class AuthService {
    signin(email:string, password: string):void{
        console.log(name,password);
    }
}