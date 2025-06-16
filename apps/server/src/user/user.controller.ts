import { Body, Controller, Get, Post, Query } from "@nestjs/common";
import { UserService } from './user.service';
import { CreateUserDto } from './user.dto';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Post()
  create(@Body() dto: CreateUserDto) {
    console.log('회원가입 요청', dto);
    const newUser = this.userService.signup(dto);
    return newUser;
  }
  // 이메일 중복 확인
  @Get('check-email')
  async checkEmail(@Query('email') email: string) {
    const isTaken = await this.userService.isEmailTaken(email);
    return { isTaken }; 
  }
}
