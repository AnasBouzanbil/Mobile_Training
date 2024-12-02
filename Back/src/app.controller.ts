import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('/services')
  getServices(): string {
    return this.appService.getServices();
  }
  @Get('/schools')
  getSchools(): string {
    return this.appService.getSchools();
  }
  @Get('/announcements')
  getAnnouncements(): string {
    return this.appService.getAnnouncements();
  }
  @Get('/clubs')
  getClubs(): string {
    return this.appService.getClubs();
  }
  @Get('/events')
  getEvents(): string {
    return this.appService.getEvents();
  }

}
