import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  // implementing the nedoint /tweets
  @Get('/tweets')
  getTweets() {
    return this.appService.getTweets();
  }
}
