import { MongooseModule } from '@nestjs/mongoose';
import { CharService } from './shared/char.service';
import { CharsController } from './chars.controller';
import { Module } from '@nestjs/common';
import { CharSchema} from './schemas/char.schema';

@Module({
    imports: [
        MongooseModule.forFeature([{ name: 'Char', schema: CharSchema}])
    ],
    controllers: [CharsController],
    providers: [CharService]
})
export class CharsModule {}
