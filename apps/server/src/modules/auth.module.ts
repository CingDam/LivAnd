import { Module } from "@nestjs/common";
import { JwtModule } from "@nestjs/jwt";
import { TypeOrmModule } from "@nestjs/typeorm";
import { AuthController } from "src/auth/auth.controller";
import { User } from "src/user/user.entity";

@Module({
    imports: [
        TypeOrmModule.forFeature([User]), // 👈 요거 추가
        JwtModule.register({ secret: 'your_jwt_secret' }) // 임시로 secret 설정 (실제는 .env에서 가져오기)
    ],
    controllers: [AuthController],
    providers:[]
})

export class AuthModule {};