import { IsString, IsEmail, isString, Length } from "class-validator";

export class CreateUserDto {
  @IsString()
  name: string;
  @IsString()
  @IsEmail()
  email: string;
  @IsString()
  @Length(4,8)
  password: string;
}
