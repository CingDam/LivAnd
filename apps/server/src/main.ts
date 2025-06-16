import { NestFactory } from '@nestjs/core';
import { AppModule } from './modules/app.module';
<<<<<<< HEAD
=======

>>>>>>> 142dc31ce4ea293cd5e9e9a2053ab9bce8d3b7e2

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.enableCors({
    origin:[ "http://localhost:3000", ],
    credentials: true,
  })

  await app.listen(process.env.PORT ?? 3001);
}
bootstrap();
