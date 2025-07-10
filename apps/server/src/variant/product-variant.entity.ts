import {
  Entity, Column, PrimaryGeneratedColumn,
  ManyToOne, JoinColumn
} from 'typeorm';
import { ProductTb } from '../product/product.entity';
import { ProductColor } from '../color/product-color.entity';
import { ProductSize } from '../size/product-size.entity';

@Entity('prod_variant_tb')
export class ProductVariant {
  @PrimaryGeneratedColumn()
  prod_variant_num: number;

  @Column()
  stock: number;

  @Column()
  extra_price: number;

  @Column()
  is_active: boolean;

  @ManyToOne(() => ProductTb, product => product.variants)
  @JoinColumn({ name: 'product_tb.prod_num' })
  product: ProductTb;

  @ManyToOne(() => ProductColor,  color => color.variants, { eager: true })
  @JoinColumn({ name: 'prod_color_tb.prod_color_num' })
  color: ProductColor;

  @ManyToOne(() => ProductSize, size => size.variants, { eager: true })
  @JoinColumn({ name: 'prod_size_tb.prod_size_num' })
  size: ProductSize;
}
