// product.service.ts
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ProductTb } from './product.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ProductService {
  constructor(
    @InjectRepository(ProductTb)
    private readonly productRepository: Repository<ProductTb>,
  ) {}

  async getAll() {
    return await this.productRepository
      .createQueryBuilder('p')
      .leftJoinAndSelect('p.category', 'c') // 카테고리와 함께 조회
      .where('p.is_active = :active', { active: 1 }) // 등록된 상품만
      .getMany();
  }
}
