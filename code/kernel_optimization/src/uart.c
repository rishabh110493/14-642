/**
 * @file   uart.c
 *
 * @brief  lower level hardware interactions for uart on pi
 *
 * @date   09/28/2016
  * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu> 
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */

#include <kstdint.h>
#include<BCM2836.h>
#include<gpio.h>
#define RX_PIN 15
#define TX_PIN 14
#define GPIO_PULL_DISABLE 0
#define AUX_MU_BAUD  (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215068)
#define AUXENB (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215004)
#define AUX_MU_IER_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215044)
#define AUX_MU_IIR_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215048)
#define AUX_MU_IO_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215040)
#define AUX_MU_LCR_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x21504c)
#define AUX_MU_LSR_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215054)
void uart_init(void) 
{

	gpio_set_pull(RX_PIN,GPIO_PULL_DISABLE);
	gpio_set_pull(TX_PIN,GPIO_PULL_DISABLE);
	gpio_config(RX_PIN,GPIO_FUN_ALT5);
	gpio_config(TX_PIN,GPIO_FUN_ALT5);

	*(AUXENB) = 0x01; //Enabling Mini UART
	*(AUX_MU_BAUD) = 270; //Setting the Baud Rate to 115200
	*(AUX_MU_IER_REG) = 0; // 
	*(AUX_MU_LCR_REG)=0x03; //Setting the UART to a 8-bit mode
	*(AUX_MU_IIR_REG)=*(AUX_MU_IIR_REG)&0xFFFFFFF9; //No interrupts (reading)
}

void uart_close(void) 
{
	*(AUXENB) = 0x00; // Disabling the mini UART
}

void uart_put_byte(uint8_t byte) 
{
	while(!(*AUX_MU_LSR_REG & 0x20)) { } // Waiting For "Transmitter Empty" to get set
	*AUX_MU_IO_REG = byte; // Copying the data to be transmitted, on the Transmit FIFO

}
uint8_t uart_get_byte(void) 
{
	while(!(*AUX_MU_LSR_REG & 0x01)) { } // Waiting For "Data Ready" to get set
	uint8_t ret = (*AUX_MU_IO_REG & 0xFF);
	//*(AUX_MU_IER_REG) |= 0x02;
	return ret;
}
