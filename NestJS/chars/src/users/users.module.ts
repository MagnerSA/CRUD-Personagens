import { MongooseModule } from '@nestjs/mongoose';
import { UserService } from './shared/user.service';
import { UsersController } from './users.controller';
import { Module } from '@nestjs/common';
import { UserSchema} from './schemas/user.schema';

@Module({
    imports: [
        MongooseModule.forFeature([{ name: 'User', schema: UserSchema}])
    ],
    controllers: [UsersController],
    providers: [UserService],
    exports: [UserService]
})
export class UsersModule {}
