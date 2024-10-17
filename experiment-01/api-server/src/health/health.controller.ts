import { Controller, Get } from '@nestjs/common';
import { HealthCheck, HealthCheckService, HttpHealthIndicator } from '@nestjs/terminus';

@Controller('health')
export class HealthController {
  constructor(
    private healthCheckService: HealthCheckService,
    private httpHealthIndicator: HttpHealthIndicator,
  ) {
  }

  // Liveness probe
  @Get('/livenessCheck')
  @HealthCheck()
  checkLiveness() {
    return this.healthCheckService.check([]);
  }

  // Optional: Add a readiness probe if you want to check for database readiness, etc.
  @Get('/readinessCheck')
  @HealthCheck()
  checkReadiness() {
    return this.healthCheckService.check([
      // Add checks here like database or external services
      // Example: async () => this.http.pingCheck('google', 'https://google.com'),
    ]);
  }
}