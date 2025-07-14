import { ProductVariant } from 'src/variant/product-variant.entity';
import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';

@Entity('prod_size_tb')
export class ProductSize {
  @PrimaryGeneratedColumn()
  prod_size_num: number;

  @Column({ type: 'varchar', length: 10, nullable: false })
  prod_size: string;

  @OneToMany(() => ProductVariant, variant => variant.size)
  variants: ProductVariant[];
}
