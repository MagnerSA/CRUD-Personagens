import { Document } from 'mongoose';

export class Char extends Document {
    name: string;
    birth: string;
    imageUrl: string;
}
