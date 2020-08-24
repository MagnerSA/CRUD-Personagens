import { AuthModule } from './auth/auth.module';
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CharsModule } from './chars/chars.module';
import { MongooseModule } from '@nestjs/mongoose';
import { UsersModule } from './users/users.module';

@Module({
  imports: [
    
    MongooseModule.forRoot('mongodb+srv://db_user:easiertorun@cluster0.pe0zd.gcp.mongodb.net/<dbname>?retryWrites=true&w=majority'),
    CharsModule,
    UsersModule,
    AuthModule,],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
