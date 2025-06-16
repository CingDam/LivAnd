import { Injectable, BadRequestException } from '@nestjs/common';
import { CreateUserDto } from './user.dto';
import { UserRepository } from './user.dao';


@Injectable()
export class UserService {
  constructor(private readonly userRepository: UserRepository) {}

  // 이메일 중복체크 
  async isEmailTaken(email: string): Promise<boolean> {
    const user = await this.userRepository.findByEmail(email);
    return !!user;  
  }

  async signup(dto: CreateUserDto) {
    try {
      await this.userRepository.registerUser(dto);
      return { message: '회원가입 완료' };
    } catch (err) {
      throw new BadRequestException(err.message);
    }

  }
}