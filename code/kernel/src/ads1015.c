/**
 * @file   ads1015.c
 *
 * @brief  I2C driver for ads1015
 *
 * @date   03 Oct 2016
 * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu> 
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */
#include <kstdint.h>
#include <i2c.h>
#include <ads1015.h>
#include<uart.h>
#include<printk.h>
#include <arm.h>
int CHANNEL;		// Global variable which stores the channel (MUX value)) set in the ADC.
void adc_init(void) 
{
	CHANNEL = 0;
}
/**
 * @param channel MUX Channel on the ADC (0,1,2,3,4,5,6,7)
 * @return The value read from the specified ADC channel
 * @brief Algorithm: Checks if the channel set in the ADC is the same as the channel which is desired to be read. 
 * If YES, read from the Conversion register and return the 16 bit value read.
 * If NO, then write to the pointer register the address of the config register, then write to the config register
 * with the appropriate encoding for the MUX (for the desired channel).
 */
uint16_t adc_read(uint8_t channel) 
{	
	uint8_t init_conv_reg[1];
	init_conv_reg[0] = ADC_CONVERSION_REG;	
	uint8_t x;
	uint8_t read_val[2];
	if(CHANNEL != channel)
	{
		uint8_t init_config[3];	
		init_config[0] = ADC_CONFIG_REG; 	
		init_config[1] = (OS_NO_EFFECT<<8)|(channel<<4)|(PGA_FS_6144<<1)|MODE_CONTINUOUS; //init_config_MSB
		init_config[2] = INIT_CONFIG_LSB_0;
				
		x = i2c_master_write(init_config, 3, ADC_ADDRESS);		// Writing the config register to the ADC with the encoding for the desired channel
		if(x == 1)												//If the writing to the config register was successful, change the global variable, CHANNEL.
			CHANNEL = channel;
			
		x = i2c_master_write(init_conv_reg, 1, ADC_ADDRESS);	//Writing the address of the conversion register to the Pointer Register	
	}	

	x = i2c_master_read(read_val, 2, ADC_ADDRESS);  				// Reading the last converted value from the ADC
	uint16_t ret_val = (((uint16_t)read_val[0]<<8)|read_val[1])>>4; //read_val[0]: higher byte and read_val[1]: Lower Byte of the data read from the ADC	
	return ret_val;
}
