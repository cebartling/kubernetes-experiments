import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get()
  healthCheck(): string {
    return this.appService.getHello();
  }

  @Get()
  readinessCheck(): string {
    return this.appService.getHello();
  }
}
