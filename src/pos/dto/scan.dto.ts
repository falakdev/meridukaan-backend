import { IsString } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class ScanDto {
  @ApiProperty({
    example: 'COKE-330ML',
    description: 'QR code value (Product SKU). Store ID is automatically taken from your assigned store.',
  })
  @IsString()
  qrValue: string;
}

