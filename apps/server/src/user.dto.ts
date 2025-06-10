import { IsEmail, IsNotEmpty, MinLength, Matches } from 'class-validator';

// 회원가입 시 클라이언트가 보내는 데이터 구조 정의
export class CreateUserDto {
  
  @IsEmail()
  user_email: string;

  @MinLength(8)
  user_pwd: string;

  @IsNotEmpty()
  user_nickname: string;

  @Matches(/^010-\d{4}-\d{4}$/)
  user_phone: string;
}