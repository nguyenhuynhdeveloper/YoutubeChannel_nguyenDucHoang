import { Global, Module } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { DatabaseService } from './database.service';

@Global()
@Module({  
  providers: [DatabaseService],
  exports: [DatabaseService]
})
export class DatabaseModule {}
