import { INestApplication, ValidationPipe } from '@nestjs/common'
import {Test} from '@nestjs/testing'
import { AppModule } from '../src/app.module'
describe('App (e2e)', () => {
  let app:INestApplication
  beforeAll(async () => {
    const allModules = await Test.createTestingModule({
      imports: [AppModule],
    }).compile()
    app = allModules.createNestApplication()
    app.useGlobalPipes(
      new ValidationPipe({
        whitelist: true
      })
    )
    await app.init()
    //when all test are done
    afterAll(() => {
      app.close()
    })
  })
  
  it.todo('should pass')
})
