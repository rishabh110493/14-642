import time

import SPI
import SSD1306

from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont

# Raspberry Pi pin configuration:
RST = 16
# Note the following are only used with SPI:
DC = 9
SPI_PORT = 0
SPI_DEVICE = 0

# 128x32 display with hardware SPI:
disp = SSD1306.SSD1306_128_32(rst=RST, dc=DC, spi=SPI.SpiDev(SPI_PORT, SPI_DEVICE, max_speed_hz=8000000))

# Initialize library.
disp.begin()

# Clear display.
disp.clear()
disp.display()

# Create blank image for drawing.
# Make sure to create image with mode '1' for 1-bit color.
width = disp.width
height = disp.height
image = Image.new('1', (width, height))

# Get drawing object to draw on image.
draw = ImageDraw.Draw(image)

# Draw a black filled box to clear the image.
draw.rectangle((0,0,width,height), outline=0, fill=0)

top = 16
x = 64

font = ImageFont.truetype('Minecraftia.ttf', 8)

f = open('tar_file', 'r')
g = open('cur_file', 'r')

last_target = "0"
last_current = "0"

while(1):
    updated_target = False
    target_string = ""

    updated_current = False
    current_string = ""
    line2 = ""
    line = f.readline()
    if(line):
        line = str(line[:len(line)-1])
	updated_target = True
	target_string = line
	last_target = line
    else:
	target_string = last_target
   
    line = g.readline() 
    if(line):
	line = str(line[:len(line)-1])
	updated_current = True
	current_string = line
	last_current = line
    else:
	current_string = last_current

    should_redraw = updated_current or updated_target

    if(should_redraw):
        line = 'Target:' + target_string
    if(should_redraw):
        line2 = 'Actual:' + current_string	
	draw.rectangle((0,0,width,height), outline=0, fill=0)
	print (line+'\t'+line2)
	draw.text((x-len(line)/2, 0), line,  font=font, fill=255)
	draw.text((x-len(line2)/2, top), line2,  font=font, fill=255)
	disp.image(image)
	disp.display()
