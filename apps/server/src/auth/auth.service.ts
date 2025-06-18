import { Injectable, UnauthorizedException } from '@nestjs/common';
import { UserRepository } from '../user/user.dao';
import { LoginDto } from './login.dto';
import * as bcrypt from 'bcrypt';

@Injectable()
export class AuthService {
  constructor(private readonly userRepository: UserRepository) {}

  async login(dto: LoginDto) {
    //console.log('로그인시도:', dto);
    const user = await this.userRepository.findByEmail(dto.user_email);
    
    if (!user) {
      //console.log('이메일 없음');
      throw new UnauthorizedException('이메일이 존재하지 않습니다');
    }

    const isMatch = await bcrypt.compare(dto.user_pwd, user.user_pwd);
    
    if (!isMatch) {
      //console.log('비밀번호 불일치');
      throw new UnauthorizedException('비밀번호가 틀렸습니다');
    }
    console.log('로그인 성공!:', user.user_num);
    return user;
  }
}
