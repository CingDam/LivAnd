
import { Controller, Post, Body, Req } from '@nestjs/common';
import * as nodemailer from 'nodemailer';
import { Request } from 'express'; // 세션 사용을 위해 필요
import { AuthService } from './auth.service'; // 로그인 처리 로직
import { LoginDto } from './login.dto';       // 로그인 요청 DTO
import { Session } from 'inspector/promises';

// 세션에 저장할 유저 타입 정의
interface SessionUser {
  user_num: number;
  user_email: string;
  user_nickname: string;
}

// 세션을 포함한 커스텀 Request 타입
type CustomRequest = Request & {
  session: {
    user?: SessionUser;
  };
};

// Controller ()안에 명칭을 써주면 명칭을 기준점으로 주소가 생성
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {} //authService를 이 컨트롤러에 연결결 
  
  // 로그인
   @Post('login')
  async login(@Body() dto: LoginDto, @Req() req: CustomRequest) {
    const user = await this.authService.login(dto);

    // 세션에 로그인한 사용자 정보 저장
    req.session.user = {
      user_num: user.user_num,
      user_email: user.user_email,
      user_nickname: user.user_nickname,
    };

    // 프론트로 로그인 성공 메시지 + 사용자 정보 전송
    return { 
      success: true,
      message: '로그인 성공', 
      user: req.session.user, 
    };
  }
  

  @Post('send-email')
  async sendCode(@Body() body: { to: string }) {
    const code = Math.floor(100000 + Math.random() * 900000);

    // ✅ 콘솔에 인증 코드 출력
    console.log(`📧 인증번호(${body.to}): ${code}`);

    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: 'smhrd0113@gmail.com',       // 👈 Gmail 주소
        pass: 'bhlefimthuqwmowh',          // 👈 앱 비밀번호
      },
    });

    await transporter.sendMail({
      from: '"인증 시스템" <your_email@gmail.com>',
      to: body.to, // 사용자 이메일로 전송
      subject: 'LivAnd 이메일 인증코드 메일입니다',
      html: `<h3>인증 코드: <b>${code}</b></h3>`,
    });

    return {
      message: '이메일이 전송되었습니다.',
      code, // 프론트로 인증번호도 같이 전송
    };
  }
}
