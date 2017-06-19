/**
 * @file   i2c.h
 *
 * @brief  I2C interface on rpi 2
 *
 * @date   03 Oct 2016
  * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu> 
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <BCM2836.h>

// I2C pins
#define I2C1_SDA 2
#define I2C1_SCL 3

// I2C Clock speeds
#define I2C_CLK_100KHZ 			0x5dc
#define I2C_CLK_RATE 			150000000
#define I2C_BAUD_RATE_100KHZ	100

#define I2C_0_BASE 	(MMIO_BASE_PHYSICAL + 0x205000)
#define I2C_1_BASE 	(MMIO_BASE_PHYSICAL + 0x804000)
#define I2C_2_BASE 	(MMIO_BASE_PHYSICAL + 0x805000)

#define C 			(volatile uint32_t *)(I2C_1_BASE + 0x00)
#define S 			(volatile uint32_t *)(I2C_1_BASE + 0x04)
#define DLEN 		(volatile uint32_t *)(I2C_1_BASE + 0x08)
#define I2C_ADDR 	(volatile uint32_t *)(I2C_1_BASE + 0x0c)
#define FIFO 		(volatile uint32_t *)(I2C_1_BASE + 0x10)
#define DIV 		(volatile uint32_t *)(I2C_1_BASE + 0x14)


#define TA 		0x01
#define DONE 	(1<<1)
#define TXW 	(1<<2)
#define RXR 	(1<<3)
#define TXD 	(1<<4)
#define RXD 	(1<<5)
#define TXE 	(1<<6)
#define RXF 	(1<<7)
#define ERR_ACK	(1<<8)

#define READ 	0x01
#define CLEAR 	(1<<4)
#define START 	(1<<7)
#define I2C_EN 	(1<<15)



/**
 * @brief initializes the I2C module
 * 
 * @param clk bus clock speed
 */ 
void i2c_master_init(uint16_t clk);

/**
 * @brief writes to I2C device
 * 
 * @param buf pointer to output data buffer
 * @param len length of output data buffer in bytes
 * @param addr slave device address
 */
uint8_t i2c_master_write(uint8_t *buf, uint16_t len, uint8_t addr);
  
/**
 * @brief reads from I2C device
 * 
 * @param buf pointer to input data buffer
 * @param len number of bytes to read
 * @param addr slave device address
 */
uint8_t i2c_master_read(uint8_t *buf, uint16_t len, uint8_t addr);
