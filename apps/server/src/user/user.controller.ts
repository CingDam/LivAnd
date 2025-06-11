import { Body, Controller, Post } from "@nestjs/common";
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
}
