import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from './user.entity';
import { Repository } from 'typeorm';
import { CreateUserDto } from './user.dto';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UserRepository {
  constructor(
    @InjectRepository(User)
    private readonly repo: Repository<User>,
  ) {}

  async findByEmail(user_email: string): Promise<User | null> {
    return this.repo.findOneBy({ user_email });
  }

  // 회원가입
   async registerUser(dto: CreateUserDto): Promise<User> {

    const hash = await bcrypt.hash(dto.user_pwd, 10);

    const user = this.repo.create({
      user_email: dto.user_email,
      user_pwd: hash,
      user_nickname: dto.user_nickname,
      user_phone: dto.user_phone,
      create_date: new Date(),
      point: 0,
    });

    const newUser = await this.repo.save(user);

    return newUser
  }
}
