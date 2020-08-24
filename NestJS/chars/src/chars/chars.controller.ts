import { CharService } from './shared/char.service';
import { Controller, Get, Param, Post, Body, Put, Delete, UseGuards } from '@nestjs/common';
import { Char } from './shared/char';
import { JwtAuthGuard } from './../auth/shared/jwt-auth.guard';

@Controller('chars')
export class CharsController {

    constructor(
        private charService: CharService
    ) {}

    @UseGuards(JwtAuthGuard)
    @Get()
    async getAll() : Promise<Char[]> {
        return this.charService.getAll();
    }

    @UseGuards(JwtAuthGuard)
    @Get(':id')
    async getById(@Param('id') id: string) : Promise<Char> {
        return this.charService.getById(id);
    }

    @UseGuards(JwtAuthGuard)
    @Post()
    async create(@Body() char: Char): Promise<Char> {
        return this.charService.create(char);
    }

    @UseGuards(JwtAuthGuard)
    @Put(':id')
    async update(@Param('id') id: string, @Body() char: Char): Promise<Char> {
        return this.charService.update(id, char);
    }

    @UseGuards(JwtAuthGuard)
    @Delete(':id')
    async delete(@Param('id') id: string) {
        this.charService.delete(id);
    }
}
