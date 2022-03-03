import { Module } from '@nestjs/common'
import { AuthenticationModule } from './authentication/authentication.module';
import { ConfigModule, ConfigService } from '@nestjs/config'

import { UserModule } from './user/user.module'
import { BookmarkModule } from './bookmark/bookmark.module'
import { DatabaseModule } from './database/database.module'

//main module that import to your app
//a module can contain providers, controllers, 
//@Module is a "decorator"
@Module({
  imports: [    
    ConfigModule.forRoot({
      isGlobal: true
    }),
    AuthenticationModule,
    UserModule,
    BookmarkModule,
    DatabaseModule
  ],
})
export class AppModule {}
