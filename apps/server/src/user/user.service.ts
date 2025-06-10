import { Injectable, BadRequestException } from '@nestjs/common';
import { CreateUserDto } from './user.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from './user.entity';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UserService {
    constructor(
        @InjectRepository(User)
        private readonly userRepository: Repository<User>, // TypeORM으로 DB연결
    ) {}

    // 회원가입 처리 함수
    async signup(dto: CreateUserDto) {
        const { user_email, user_pwd, user_nickname, user_phone } = dto;

        // 이메일 중복 확인
        const exist = await this.userRepository.findOneBy({ user_email });
        if (exist) throw new BadRequestException('이미 가입된 이메일');
    
       // 비밀번호 암호화
        const hash = await bcrypt.hash(user_pwd, 10);

        // 사용자 정보 생성 및 저장
        const user = this.userRepository.create({
            user_email,
            user_pwd: hash,
            user_nickname,
            user_phone,
            create_date: new Date(), // 가입 일시 수동 설정
            point: 0,                // 초기 포인트 0
        });

        await this.userRepository.save(user);
        return { message: '회원가입 완료' };
    }
}
    
