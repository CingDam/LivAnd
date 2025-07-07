// cate.entity.ts
import { OneToMany, Column, Entity, PrimaryGeneratedColumn } from 'typeorm';
import { ProductTb } from '../product/product.entity';

@Entity('cate_tb')
export class CateTb {
  @PrimaryGeneratedColumn()
  cate_num: number;

  @Column()
  cate_name: string;

  @Column({ nullable: true })
  cate_depth: number;

  @Column({ nullable: true })
  parent_id: number;

  @OneToMany(() => ProductTb, product => product.category)
  products: ProductTb[];
}