// server/src/app.controller.ts
import { Controller, Post, Body } from '@nestjs/common';
import * as nodemailer from 'nodemailer';

@Controller('')
export class AppController {
  @Post('/auth/send-email')
  async sendCode(@Body() body: { email: string }) {
    const code = Math.floor(100000 + Math.random() * 900000);

        // ✅ 콘솔에 인증 코드 출력
    console.log(`📧 인증번호(${body.email}): ${code}`);

    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: 'smhrd0113@gmail.com',       // 👈 Gmail 주소
        pass: 'bhlefimthuqwmowh',          // 👈 앱 비밀번호
      },
    });

    await transporter.sendMail({
      from: '"인증 시스템" <your_email@gmail.com>',
      to: "smhrd0113@gmail.com",
      subject: 'LivAnd 이메일 인증코드 메일입니다',
      html: `<h3>인증 코드: <b>${code}</b></h3>`,
    });



    return {
      message: '이메일이 전송되었습니다.',
      code, // 프론트로 인증번호도 같이 전송
    };
  }
}
