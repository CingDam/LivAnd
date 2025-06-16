import { NestFactory } from '@nestjs/core';
import { AppModule } from './modules/app.module';
const expressSession = require('express-session');

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

    // 🔐 세션 등록 (꼭 넣어야 req.session이 활성화됨)
  app.use(
  expressSession({
    secret: 'my-secret-key', // 쿠키에 서명할 비밀 키
    resave: false, //요청마다 세션 다시 저장할지 여부
    saveUninitialized: false, //초기화되지 않은 세션 저장 여부
    cookie: {
      maxAge: 1000 * 60 * 60, // 1시간 동안 세션 유지
    },
  }),
);

  app.enableCors({
    origin:[ "http://localhost:3000", ],
    credentials: true,
  })

  await app.listen(process.env.PORT ?? 3001);
}


bootstrap();


function session(arg0: {
  secret: string; // 쿠키 서명용 비밀키 (아무 문자열이나 가능)
  resave: boolean; saveUninitialized: boolean; cookie: { maxAge: number; };
}): any {
  throw new Error('Function not implemented.');
}

