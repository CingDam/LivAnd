
import { Controller, Get, Query, Res, Redirect, Post, Body, Req } from '@nestjs/common';
import * as nodemailer from 'nodemailer';
import { Response } from 'express';
import axios from 'axios';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from '../user/user.entity'; // 경로는 실제 위치에 맞게 수정
import { JwtService } from '@nestjs/jwt';
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
    constructor(
      @InjectRepository(User)
      private readonly userRepository: Repository<User>,
      private readonly jwtService: JwtService,
      private readonly authService: AuthService
    ) {}
  
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

  // 🔻 여기부터 추가된 소셜 로그인 메서드들 🔻

  @Get('kakao')
  @Redirect()
  kakaoLogin() {
    const REST_API_KEY = process.env.KAKAO_CLIENT_ID;
    const CLIENT_SECRET = process.env.KAKAO_CLIENT_SECRET;
    const REDIRECT_URI = 'http://localhost:3000/auth/kakao/callback';
    const state = Math.random().toString(36).slice(2);

    const kakaoUrl = `https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&state=${state}`;

    console.log('Redirect URL:', kakaoUrl);

    return { url: kakaoUrl };
  }

  @Get('kakao/callback')
  async kakaoCallback(@Query('code') code: string, @Res() res: Response) {
    try {
      const tokenRes = await axios.post(
        'https://kauth.kakao.com/oauth/token',
        null,
        {
          params: {
            grant_type: 'authorization_code',
            client_id: process.env.KAKAO_CLIENT_ID,
            redirect_uri: 'http://localhost:3001/auth/kakao/callback',
            code,
            client_secret: process.env.KAKAO_CLIENT_SECRET, // 선택사항
          },
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
          },
        },
      );

      const accessToken = tokenRes.data.access_token;

      const userRes = await axios.get('https://kapi.kakao.com/v2/user/me', {
        headers: { Authorization: `Bearer ${accessToken}` },
      });

      const kakaoData = userRes.data;
      const kakaoId = kakaoData.id.toString();
      const email = kakaoData.kakao_account?.email || '';
      const nickname = kakaoData.properties?.nickname || '';
      const profileImage = kakaoData.properties?.profile_image || '';

      console.log(kakaoId);

      let user = await this.userRepository.findOne({ where: { kakao_id : kakaoId } });
      if (!user) {
        user = this.userRepository.create({
          kakao_id : kakaoId,
          user_email : email,
          user_nickname : nickname,
          user_pwd: '',      // 소셜 로그인 시 임의 처리
          user_phone: '',    // 소셜 로그인 시 임의 처리
          // user_pwd나 user_phone은 소셜 로그인이라면 null 또는 빈 문자열로 처리 가능
        });
        await this.userRepository.save(user); // db에 저장
      }

      const jwt = this.jwtService.sign({ sub: user.user_num });

      return res.redirect(`http://localhost:3000/social-login-success?token=${jwt}`);
    } catch (err) {
      console.error('카카오 로그인 실패:', err);
      return res.status(500).send('카카오 로그인 실패');
    }
  }

@Get('naver')
@Redirect()
naverLogin() {
  const clientId = process.env.NAVER_CLIENT_ID;
  const redirectUri = process.env.NAVER_REDIRECT_URI;
  const state = Math.random().toString(36).substring(2);

  const url = `https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=${clientId}&redirect_uri=${redirectUri}&state=${state}`;
  return { url };
}

  @Get('naver/callback')
  async naverCallback(@Query() query, @Res() res: Response) {
    try {
      const { code, state } = query;

      const tokenRes = await axios.post(
        `https://nid.naver.com/oauth2.0/token`,
        null,
        {
          params: {
            grant_type: 'authorization_code',
            client_id: process.env.NAVER_CLIENT_ID,
            client_secret: process.env.NAVER_CLIENT_SECRET,
            code,
            state,
          },
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        },
      );

      const accessToken = tokenRes.data.access_token;

      const userRes = await axios.get('https://openapi.naver.com/v1/nid/me', {
        headers: { Authorization: `Bearer ${accessToken}` },
      });

      const naverData = userRes.data.response;
      const naverId = naverData.id;
      const email = naverData.email || '';
      const nickname = naverData.nickname || '';

      let user = await this.userRepository.findOne({ where: { naver_id : naverId } }); // kakao_id → 나중에 naver_id 따로 만들면 좋음
      if (!user) {
        user = this.userRepository.create({
          naver_id: naverId, // 임시로 사용
          user_email: email,
          user_nickname: nickname,
          user_pwd: '',
          user_phone: '',
        });
        await this.userRepository.save(user);
      }

      const jwt = this.jwtService.sign({ sub: user.user_num });
      return res.redirect(`http://localhost:3000/social-login-success?token=${jwt}`);
    } catch (err) {
      console.error('네이버 로그인 실패:', err);
      return res.status(500).send('네이버 로그인 실패');
    }
  }
}
