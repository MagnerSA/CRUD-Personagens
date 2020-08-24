import { Char } from './char';
import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';

@Injectable()
export class CharService {
    
    constructor(@InjectModel('Char') private readonly charModel: Model<Char>) {}

    async getAll() {
        return await this.charModel.find().exec();
    }

    async getById(id: string) {
        return await this.charModel.findById(id).exec();
    }

    async create(char: Char) {
        const createdChar = new this.charModel(char);
        return await createdChar.save()
    }

    async update(id: string, char: Char) {
        await this.charModel.updateOne({ _id: id }, char).exec();
        return this.getById(id);
    }

    async delete(id: string) {
        return await this.charModel.deleteOne({ _id: id }).exec();
    }

}
