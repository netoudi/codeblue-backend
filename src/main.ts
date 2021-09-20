import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { AppModule } from './app.module';
import { makeKafkaOptions } from './common/kafka-config';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { cors: true });
  app.useGlobalPipes(
    new ValidationPipe({
      errorHttpStatusCode: 422,
    }),
  );
  app.connectMicroservice(makeKafkaOptions());

  await app.startAllMicroservices();
  await app.listen(3333);
}

bootstrap();
