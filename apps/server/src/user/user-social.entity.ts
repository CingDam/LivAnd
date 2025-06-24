import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import { User } from './user.entity'; // 경로는 실제 위치에 맞게 수정


// user-social.entity.ts
@Entity('user_social_tb') // 실제 DB 테이블명
export class UserSocial {
  @PrimaryGeneratedColumn()
  user_social_num: number; // PK

  @Column({ length: 100 })
  sns_uid: string; // 소셜 플랫폼의 사용자 ID

  @Column({ type: 'varchar', length: 20 })
  provider: string; // ex) 'kakao', 'naver'

  @ManyToOne(() => User, (user) => user.socials, { onDelete: 'CASCADE' })
  @JoinColumn({ name: 'user_num' }) // FK 컬럼 이름
  user: User;
}
