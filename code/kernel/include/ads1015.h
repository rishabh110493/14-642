/**
 * @file   ads1015.h
 *
 * @brief  ADS1050 interface over I2C
 *
 * @date   03 Oct 2016
  * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu> 
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */

#ifndef _ADS1050_H_
#define _ADS1050_H_
#define ADC_ADDRESS 		0x49
#define ADC_CONVERSION_REG 	0x00
#define ADC_CONFIG_REG 		0x01
#define ADC_LO_THRES_REG 	0x02
#define ADC_HI_THRES_REG 	0x03
#define INIT_CONFIG_LSB_0 	0x00

#define CHANNEL_0_DIFF 		0x00
#define CHANNEL_1_DIFF 		0x01
#define CHANNEL_2_DIFF 		0x02
#define CHANNEL_3_DIFF 		0x03
#define CHANNEL_0_GND 		0x04
#define CHANNEL_1_GND 		0x05
#define CHANNEL_2_GND 		0x06
#define CHANNEL_3_GND 		0x07
	
#define PGA_FS_6144 		0x00
#define PGA_FS_4096 		0x01
#define PGA_FS_2048 		0x02
#define PGA_FS_1024 		0x03
#define PGA_FS_0512 		0x04
#define PGA_FS_0256 		0x05


#define MODE_CONTINUOUS 	0x00
#define MODE_SINGLE_SHOT 	0x01

#define OS_NO_EFFECT 		0x00

#include <kstdint.h>

/**
 * @brief initialize ADS1015
 */
void adc_init(void);

/**
 * @param channel MUX Channel on the ADC (0,1,2,3,4,5,6,7)
 * @return The value read from the specified ADC channel
 * @brief Checks if the channel set in the ADC is the same as the channel which is desired to be read. 
 *  If YES, read from the Conversion register and return the 16 bit value read.
 * If NO, then write to the pointer register the address of the config register, then write to the config register
 * with the appropriate encoding for the MUX (for the desired channel).
 */
uint16_t adc_read(uint8_t channel);

#endif /* _ADC_DRIVER_H_ */
