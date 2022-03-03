import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class DatabaseService extends PrismaClient{
    constructor(config: ConfigService) {
        super({
            datasources: {
                db: {
                    //url: 'postgresql://postgres:Abc123456789@@localhost:5433/myDB?schema=public'
                    url: config.get('DATABASE_URL')
                }
            }
        })
        console.log(config.get('DATABASE_URL'))
    }

}
