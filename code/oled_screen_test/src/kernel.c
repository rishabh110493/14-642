/**
 * @file   kernel.c
 *
 * @brief  entry point to the raspberry pi kernel
 *
 * @date   September 8 2015
 * @author Aaron Reyes <areyes@andrew.cmu.edu>
 */

#include <arm.h>

#include <spi.h>
#include <screen.h>
#include <gpio.h>


void kernel_main(void) {
  int row=0,col=0;
  
  oled_init();

  oled_buf_clr();
  while(1) {
  if(col>127) { col=0; row++; }
  if(row>31) { col=0; row=0; }
  // set box
  oled_buf_pixel_set(row,col);
  oled_buf_pixel_set(row,col+1);
  oled_buf_pixel_set(row+1,col);
  oled_buf_pixel_set(row+1,col+1);
  // draw
  oled_buf_draw(); 
  // clr box
  oled_buf_pixel_clr(row,col);
  oled_buf_pixel_clr(row,col+1);
  oled_buf_pixel_clr(row+1,col);
  oled_buf_pixel_clr(row+1,col+1);
  // move box to the right one pixel
  col++;
  }


}
