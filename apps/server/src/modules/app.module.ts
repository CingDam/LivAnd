import { Module } from '@nestjs/common';
import { UserModule } from './user.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { typeOrmConfig } from 'src/config/typeorm.config';
import { ConfigModule } from '@nestjs/config';
import { UserController } from 'src/user/user.controller';
import { AuthModule } from './auth.module';


@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal:true,
    }),
    TypeOrmModule.forRoot(typeOrmConfig),
    UserModule, AuthModule
  ],
  controllers: [UserController],
  providers: [],
})
export class AppModule {}
