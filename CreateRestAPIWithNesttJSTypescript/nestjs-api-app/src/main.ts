import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
/**
 g = generate
nest g module user
yarn add -D prisma
yarn add @prisma/client
npx prisma init
It will generate an .env file
After define models:
npx prisma migrate dev
Entername: initial

docker compose up dev-db -d
docker logs
npx prisma generate
Connect to the database:
npx prisma studio

nest g module database
nest g service database --no-spec
yarn add class-validator class-transformer
yarn add argon2
After adding relationship between 2 tables:
npx prisma migrate dev
npx prisma studio
//force, s:stop, v:remove volume
docker compose rm dev-db -s -f -v
Modify package.json and run:
yarn db:restart 
yarn start:dev
To config db_url, let's install 
yarn add @nestjs/config
create new folder named src/config

yarn add @nestjs/passport passport @nestjs/jwt passport-jwt 
access http://jwt.io to see the example of JWT
install as "dev"
yarn add -D @types/passport-jwt

try to decode using http://jwt.io
Add strategy, then 
nest g controller user --no-spec 

send Register again, return 201 !

end to end testing
yarn add -D pactum
yarn test:e2e
open package.json, add "--watch --no-cache" to "test:e2e"

yarn add -D dotenv-cli 
create file .env.test

 */
async function bootstrap() {
  const app = await NestFactory.create(AppModule)
  app.useGlobalPipes(new ValidationPipe({
    whitelist: true //remove other fields which are not related to DTO's fields
  }))  
  await app.listen(3003); //3000 maybe for React app
}
bootstrap();
