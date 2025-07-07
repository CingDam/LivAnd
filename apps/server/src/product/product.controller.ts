// product.controller.ts
import { Controller, Get, Param, Req } from '@nestjs/common';
import { ProductService } from './product.service';
import { ProductTb } from './product.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

@Controller('products')
export class ProductController {
  constructor(
  @InjectRepository(ProductTb)
  private readonly productRepository: Repository<ProductTb>,
) {}

    @Get()
    async getAllProducts(): Promise<ProductTb[]> {
    const products = await this.productRepository.find({ relations: ['category'] });
    console.log('조회된 상품들:', products); // 콘솔창에서 확인
    return products;
    }

    // @Get(':category')
    // async getProductsByCategory(
    // @Param('category') category: string,  // /products/outer → outer가 @Param('category')로 들어옴
    // ): Promise<ProductTb[]> {  // 그걸 이용해 cate_tb.cate_name = 'outer' 조건으로 product_tb 조회함
    // const products = await this.productRepository
    //     .createQueryBuilder('product')
    //     .leftJoinAndSelect('product.category', 'category')  // leftJoinAndSelect으로 조인해서 카테고리 정보도 같이 가져옴
    //     .where('category.cate_name = :category', { category })
    //     .andWhere('product.is_active = 1')
    //     .getMany();

    // return products;

@Get('blouse-shirt')
getBlouseShirtProducts(): Promise<ProductTb[]> {
  return this.getProductsByFixedCategory('blouse-shirt');
}

@Get('outer')
getOuterProducts(): Promise<ProductTb[]> {
  return this.getProductsByFixedCategory('outer');
}

@Get('knit-cardigan')
getKnitCardiganProducts(): Promise<ProductTb[]> {
  return this.getProductsByFixedCategory('knit-cardigan');
}

@Get('tshirt')
getTshirtProducts(): Promise<ProductTb[]> {
  return this.getProductsByFixedCategory('tshirt');
}

@Get('onepiece')
getOnepieceProducts(): Promise<ProductTb[]> {
  return this.getProductsByFixedCategory('onepiece');
}

@Get('skirt')
getSkirtProducts(): Promise<ProductTb[]> {
  return this.getProductsByFixedCategory('skirt');
}

@Get('pants')
getPantsProducts(): Promise<ProductTb[]> {
  return this.getProductsByFixedCategory('pants');
}

@Get('necklace')
getNecklaceProducts(): Promise<ProductTb[]> {
  return this.getProductsByFixedCategory('necklace');
}

@Get('bracelet')
getBraceletProducts(): Promise<ProductTb[]> {
  return this.getProductsByFixedCategory('bracelet');
}

@Get('ring')
getRingProducts(): Promise<ProductTb[]> {
  return this.getProductsByFixedCategory('ring');
}

// 아래는 중복 제거를 위한 private 메서드
private getProductsByFixedCategory(category: string): Promise<ProductTb[]> {
    return this.productRepository
        .createQueryBuilder('product')
        .leftJoinAndSelect('product.category', 'category')
        .where('category.cate_name = :category', { category })
        .andWhere('product.is_active = 1')
        .getMany();
    }
}


