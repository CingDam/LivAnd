import { Entity, Column, PrimaryGeneratedColumn, CreateDateColumn } from 'typeorm';

// user_tb 테이블과 매핑되는 Entity
@Entity('user_tb')
export class User {
  @PrimaryGeneratedColumn()
  user_num: number; 

  @Column({ length: 45 })
  user_email: string; 

  @Column({ length: 200 })
  user_pwd: string;

  @Column({ length: 45 })
  user_nickname: string;

  @Column({ length: 16 })
  user_phone: string; 

//   @Column({ nullable: true })
//   kakao_id: string; // 카카오 로그인 ID (소셜 로그인용)

//   @Column({ nullable: true })
//   naver_id: string; // 네이버 로그인 ID

  @CreateDateColumn({ type: 'datetime' })
  create_date: Date; // 가입 일시

  @Column({ default: 0 })
  point: number; // 초기 포인트
}
