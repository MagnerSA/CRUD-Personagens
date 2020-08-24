import * as mongoose from 'mongoose';

export const CharSchema = new mongoose.Schema({
    name: String,
    birth: String,
    imageUrl: String,
})