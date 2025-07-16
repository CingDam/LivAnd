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

  @Get('test')
  test() {
    console.log('🔥 test 라우터 들어옴');
    return 'ok';
  }

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

// @Get('blouse-shirt')
// getBlouseShirtProducts(): Promise<ProductTb[]> {
//   return this.getProductsByCateNames(['블라우스', '셔츠']);
// }

@Get('blouse-shirt')
async getBlouseShirtProducts(): Promise<ProductTb[]> {
  const result = await this.productRepository
    .createQueryBuilder('product')
    .leftJoinAndSelect('product.category', 'category')
    .where('category.cate_name IN (:...names)', { names: ['블라우스', '셔츠'] })
    .andWhere('product.is_active = 1')
    .getMany();

  console.log('🧥 blouse-shirt 결과:', result);
  return result;
}

@Get('outer')
async getOuterProducts(): Promise<ProductTb[]> {
  const result = await this.getProductsByCateNames(['아우터']);
  console.log('🧥 outer 결과:', result);
  return result;
}

@Get('knit-cardigan')
async getKnitCardiganProducts(): Promise<ProductTb[]> {
  const result = await this.getProductsByCateNames(['니트', '가디건']);
  console.log('🧶 knit-cardigan 결과:', result);
  return result;
}

@Get('tshirt')
async getTshirtProducts(): Promise<ProductTb[]> {
  const result = await this.getProductsByCateNames(['티셔츠']);
  console.log('👕 tshirt 결과:', result);
  return result;
}

@Get('onepiece')
async getOnepieceProducts(): Promise<ProductTb[]> {
  const result = await this.getProductsByCateNames(['원피스']);
  console.log('👗 onepiece 결과:', result);
  return result;
}

@Get('skirt')
async getSkirtProducts(): Promise<ProductTb[]> {
  const result = await this.getProductsByCateNames(['스커트']);
  console.log('👚 skirt 결과:', result);
  return result;
}

@Get('pants')
async getPantsProducts(): Promise<ProductTb[]> {
  const result = await this.getProductsByCateNames(['팬츠']);
  console.log('👖 pants 결과:', result);
  return result;
}

@Get('necklace')
async getNecklaceProducts(): Promise<ProductTb[]> {
  const result = await this.getProductsByCateNames(['목걸이']);
  console.log('📿 necklace 결과:', result);
  return result;
}

@Get('bracelet')
async getBraceletProducts(): Promise<ProductTb[]> {
  const result = await this.getProductsByCateNames(['팔찌']);
  console.log('🪢 bracelet 결과:', result);
  return result;
}

@Get('ring')
async getRingProducts(): Promise<ProductTb[]> {
  const result = await this.getProductsByCateNames(['반지']);
  console.log('💍 ring 결과:', result);
  return result;
}

private getProductsByCateNames(cateNames: string[]): Promise<ProductTb[]> {
  return this.productRepository
    .createQueryBuilder('product')
    .leftJoinAndSelect('product.category', 'category')
    .where('category.cate_name IN (:...cateNames)', { cateNames })
    .andWhere('product.is_active = 1')
    .getMany();
}

@Get('with-variants')
async getProductsWithVariants(): Promise<ProductTb[]> {
  const result = await this.productRepository.find({
    
    relations: [
      'category',
      'variants',
      'variants.color',
      'variants.size',
    ],
    where: { is_active: true },
  });

  result.forEach(p => {
    console.log(`상품: ${p.prod_name}`);
    p.variants.forEach(v => {
      console.log(`  - 색상: ${v.color?.color_name}`);
      console.log(`  - 사이즈: ${v.size?.prod_size}`);
    });
  });

  return result;
}


}