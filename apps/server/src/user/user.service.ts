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
      const newUser = await this.userRepository.registerUser(dto);
      if(newUser) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      throw new BadRequestException(err.message);
    }

  }
}