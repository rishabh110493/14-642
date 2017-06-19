/**
 * @file   i2c.c
 *
 * @brief  I2C implementation on rpi 2
 *
 * @date   03 Oct 2016
  * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu> 
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */

#include <kstdint.h>
#include<BCM2836.h>
#include<gpio.h>
#include<i2c.h>
#include<printk.h>

/**
 * @brief initializes the I2C module
 * 
 * @param clk bus clock speed in KHz
 */ 
void i2c_master_init(uint16_t clk)		// clk = baud rate in KHz
{
	gpio_set_pull(I2C1_SDA,GPIO_PULL_UP);
	gpio_set_pull(I2C1_SCL,GPIO_PULL_UP);
	gpio_config(I2C1_SDA,GPIO_FUN_ALT0);
	gpio_config(I2C1_SCL,GPIO_FUN_ALT0);
	*C=(I2C_EN|CLEAR|READ); // Enabling the IC2 1 , Clearing the FIFO, Putting it in Read mode by default 
	*DIV= I2C_CLK_RATE/(clk*1000); 	// Setting the Divisor for setting the baud rate of transfer
}

/**
 * @param *buf Pointer to the memory location from which the values would be written.
 * @param len Length of data to be written.
 * @param addr Address of I2C device.
 * @return 0: Write Failure  1: Write Successful
 * @brief Algorithm: Clear off previously set flags, set the values of the DLEN and Address registers 
 * and set the start bit to 1. Wait for the transfer process to become active (TA). 
 * Once the transfer is active, check if the FIFO can accept data (TXD) and keep writing to the FIFO until the whole data
 * has been written. If the FIFO gets filled, wait for it to be able to start accepting data again. If acknowledgement errors 
 * are encountered, the write process is terminated and 0 is returned.
 */
uint8_t i2c_master_write(uint8_t *buf, uint16_t len, uint8_t addr) 
{
	*C |= CLEAR;  				// Clearing the FIFO
	*S |= (DONE|ERR_ACK);  		// Clearing the DONE and ERR_ACK flag bits	
	*I2C_ADDR = addr;			// Setting the Address of the I2C device 
	*DLEN = len;   				// Setting the length of data to be written	

	*C = I2C_EN|START|CLEAR; 	 // Start Transfer with mode set to WRITE and Clear the FIFO 
	while(!(*S & TA)) {}		// Waiting for the Transfer Active bit to get set
	while(*S & TA)
	{  
		while (!(*S & TXD)) {}		// Waiting for TXD to get set, ie for FIFO to be able to accept data
		while((*S & TXD) && (len))	// If FIFO can accept data, load data into FIFO
		{
			*FIFO = *buf;			
			len--;
			buf++;
		}	  
		if(*S & ERR_ACK) // Checking for Acknowledgement Errors
		{			
			return 0;	// If Acknowledgement Errors are encountered, the transfer is terminated
		}		  
	}  
	return ((*S & DONE)>>1); // Returning 1 if DONE = 1, else 0
}

/**
 * @param *buf Pointer to the memory location where the read values would be stored.
 * @param len Length of data to be read.
 * @param addr Address of I2C device.
 * @return 0: Read Failure  1: Read Successful
 * @brief Algorithm: Clear off previously set flags, set the DLEN and Address registers, Set the start bit to 1
 * and wait for the data to get populated in the FIFO (RXD). Check for the errors in acknowledgement while waiting. If an 
 * acknowledgement error is encountered, the read process is terminated and the value returned is 0. 
 * Once the data is availablein the FIFO register (RXD), read it byte by byte and copy it to 
 * the location pointed by 'buf'.
 */
uint8_t i2c_master_read(uint8_t *buf, uint16_t len, uint8_t addr) 
{
	*S |= (DONE|ERR_ACK);  			// Clearing the DONE and ERR_ACK flag bits	
	*I2C_ADDR = addr;				// Setting the address of the I2C device to be read from
	*DLEN = len;					//Setting the number of bytes to be read	
	*C = I2C_EN|START|CLEAR|READ;	//Start Transfer, clear FIFO and set mode to READ

	while(!(*S & RXD))// Wait for the RXD bit to get set, ie FIFO to get populated
	{
		if(*S & ERR_ACK)
		{
			return 0;	//Should the device not respond, the read operation must be terminated.
		}
	}
	while(*S & RXD)  // Read the data from the FIFO and copy to the destination buffer location until the FIFO is empty
	{
		*(buf++) = *FIFO; 				
	} 
	while(!(*S & DONE)) 
	{
		if(*S & ERR_ACK)
		{
			return 0;	//Should the device not respond, the read operation must be terminated.
		}		
	}
	*C |= CLEAR;	
  return 1;	 // If everything ended well, 1 is returned
}