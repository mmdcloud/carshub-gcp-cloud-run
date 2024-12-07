import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { NestExpressApplication } from '@nestjs/platform-express';
async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(
    AppModule,
  );  
  app.enableCors({
    origin: true,
    methods: ["GET", "POST", "PATCH", "DELETE", "PUT"]
  });
  await app.listen(3000);
}
bootstrap();