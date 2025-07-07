import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import { CateTb } from '../cate/cate.entity'; // 카테고리 엔티티


@Entity('product_tb')
export class ProductTb {
  @PrimaryGeneratedColumn()
  prod_num: number;

  @Column()
  prod_name: string;

  @Column()
  price: number;

  @Column()
  create_date: Date;

  @Column()
  is_active: boolean;

  @Column()
  view_count: number;

  @ManyToOne(() => CateTb, cate => cate.products)
  @JoinColumn({ name: 'cate_tb.cate_num' })
  category: CateTb;
}

