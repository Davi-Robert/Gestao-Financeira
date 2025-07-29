import { IsEmail, IsString } from "class-validator";

export class UserAuthDTO{
  @IsString()
  @IsEmail()
  email: string;

  @IsString()
  password: string;
}