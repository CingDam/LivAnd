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

  createUser(data: Partial<User>) {
    return this.repo.create(data);
  }

  async saveUser(user: User) {
    return this.repo.save(user);
  }

  // 회원가입
   async registerUser(dto: CreateUserDto): Promise<void> {
    const exist = await this.findByEmail(dto.user_email);
    if (exist) {
      throw new Error('이미 가입된 이메일');
    }

    const hash = await bcrypt.hash(dto.user_pwd, 10);

    const user = this.createUser({
      user_email: dto.user_email,
      user_pwd: hash,
      user_nickname: dto.user_nickname,
      user_phone: dto.user_phone,
      create_date: new Date(),
      point: 0,
    });

    await this.saveUser(user);
  }
}
