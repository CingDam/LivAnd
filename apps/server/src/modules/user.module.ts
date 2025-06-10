import { Module } from '@nestjs/common';
import { UserController } from '../user/user.controller';
import { UserService } from '../user/user.service';
import { User } from '../user/user.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([User])],
  controllers: [UserController],
  providers: [UserService],
})
export class UserModule {}
