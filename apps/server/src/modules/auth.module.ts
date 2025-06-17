
import { Module } from "@nestjs/common";
import { JwtModule } from "@nestjs/jwt";
import { AuthController } from '../auth/auth.controller';
import { AuthService } from '../auth/auth.service';
import { UserRepository } from '../user/user.dao';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from '../user/user.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([User]), // 👈 요거 추가
    JwtModule.register({ secret: 'your_jwt_secret' }) // 임시로 secret 설정 (실제는 .env에서 가져오기)
  ],
  controllers: [AuthController],
  providers: [AuthService, UserRepository],
})
export class AuthModule {}
