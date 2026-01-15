import { Controller, Get } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse } from '@nestjs/swagger';
import { StoresService } from './stores.service';
import { Public } from '../common/decorators/public.decorator';

@ApiTags('Stores')
@Controller('stores')
export class StoresController {
  constructor(private readonly storesService: StoresService) {}

  @Public()
  @Get()
  @ApiOperation({ 
    summary: 'Get all stores', 
    description: 'Retrieve a list of all stores. Public endpoint - no authentication required. Use this to get store IDs for user signup.' 
  })
  @ApiResponse({ 
    status: 200, 
    description: 'List of stores retrieved successfully',
    schema: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          id: { type: 'string', example: '4158f662-9e15-42ef-9c4e-345b9465693c' },
          name: { type: 'string', example: 'Store Karachi Central' },
          region: { type: 'string', example: 'Sindh' },
          city: { type: 'string', example: 'Karachi' },
          createdAt: { type: 'string', format: 'date-time' },
          updatedAt: { type: 'string', format: 'date-time' },
        },
      },
    },
  })
  async findAll() {
    return this.storesService.findAll();
  }
}
