import { ProductVariant } from 'src/variant/product-variant.entity';
import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';

@Entity('prod_color_tb')
export class ProductColor {
  @PrimaryGeneratedColumn()
  prod_color_num: number;

  @Column({ type: 'varchar', length: 45, nullable: false })
  color_name: string;

  @Column({ type: 'varchar', length: 45, nullable: false })
  color_code: string;

  @Column({ type: 'varchar', length: 45, nullable: false })
  border_color: string;

  @OneToMany(() => ProductVariant, variant => variant.color)
  variants: ProductVariant[];
}
