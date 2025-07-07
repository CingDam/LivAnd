// src/modules/product.module.ts
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ProductTb } from '../product/product.entity'; // 경로 수정
import { ProductController } from '../product/product.controller'; // 경로 수정
import { ProductService } from '../product/product.service'; // 서비스도 추가 필요
import { CateTb } from 'src/cate/cate.entity';

@Module({
  imports: [TypeOrmModule.forFeature([ProductTb, CateTb])],
  controllers: [ProductController],
  providers: [ProductService], // 이 줄도 꼭 추가
})
export class ProductModule {}
