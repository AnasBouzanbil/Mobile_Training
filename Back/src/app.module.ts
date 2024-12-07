import { Module, NestModule, MiddlewareConsumer } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ServicesService } from './services/services.service';
import * as express from 'express';
import { join } from 'path';
import { TalkGateway } from './talk/talk.gateway';
import { TalkService } from './talk/talk.service';

@Module({
  imports: [],
  controllers: [AppController],
  providers: [AppService, ServicesService, TalkGateway, TalkService],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer) {
    consumer
      .apply(express.static(join(__dirname, '..', 'assets/services', )))
      .forRoutes('/polesport', '/schools', '/services', '/clubs', '/events', '/announcements');
  }
}
