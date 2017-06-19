*****************************************************************************
*																	        *
*		Instructions for compiling files and building the system		    *
*               				Team O                                      *
*****************************************************************************
0. Assumed Initial Setup (Very Important)
	We shall assume that all the setup steps mentioned in the handout for Lab4 
	have been followed. We assume the following setup:
	
	1. The files/folders provided in the handout for Lab 4 were copied to the
		local working directory in the ECE 349 VM.
	2. Linux Kernel Sources were obtained from the mentioned source by running 
		$ make sources
	3. The OS installed in the SD Card of the Raspberry Pi is Raspbian Jessie
		Lite which was released on 23rd September, 2016.
	4. The IP address of the Raspberry Pi is known. 
		In our case, we set a static IP to the Raspberry Pi by modifying the
		file, 'cmdline.txt' in the SD card.
		Modification made: Append the following to the contents of the file:
		ip=192.168.137.56
		Save the file. When the Pi is booted up with this SD card in place, it
		will have the IP address 192.168.137.56
	5. Having known the IP of the Raspberry Pi, we perform all our 
		communications with the Pi via an Ethernet Cable and SSHing into
		our Pi from the VM.
	6. The python-dev tools have already been installed in the OS residing in 
		the SD card of the Pi.

1. List of Files:
	Makefile
	LKM Source Files:
		1. motor.c
		2. motor_pwm.c
		3. encoder.c
		
	Compiled LKM Files:
		1. motor.ko
		2. motor_pwm.ko
		3. encoder.ko
		
	User-space Application Source Files:
		1. /UserSpace_sources/pid_pos.c
		2. /UserSpace_sources/pid_speed.c
		3. /UserSpace_sources/encoder_pos.c
		4. /UserSpace_sources/encoder_pos.c
		
	Python Script for Visualization:
		1. screen.py
	
2. Steps to compile and build the system
	1. Copy the following to the local working directory in the VM:
		a. All the LKM Source Files.
		b. the whole folder, UserSpace_sources
		c. The Makefile
	2. Compile the LKM files by running the make file with no arguments. 
		The Makefile has been modified to incorporate the LKM files mentioned.
		$ make 
	3. Copy all the compiled .ko files to the Raspberry Pi by using the  
		following command:
		$ scp .ko pi@192.168.137.56:~/
		Here, the IP address of our Pi is 192.168.137.56. It is dependent on 
		what IP address, the user chose to set for the Pi.
	4. Copy all the User-space Application Source Files to the Pi using the 
		following command:
		$ scp ./UserSpace_sources/*.c pi@192.168.137.56:~/
		Once again, the IP address of our Pi is 192.168.137.56. It is dependent  
		on what IP address , the user chose to set for the Pi.		
	5. Insert the SD card on your computer. While accessing the SD card via 
		the VM, there shall appear 2 partitions: 'boot' and '7.9 GB Volume'
		Source: The local working directory on the VM
		Destination: /home/pi  on the SD Card partition indicated as '7.9 GB
		 Volume'. Copy the following:
		
		a. The whole folder: spidev-3.2
		b. The whole folder: Imaging-1.1.7
		c. happycat_oled_64.ppm
		d. happycat_oled_32.ppm
		e. All the .py files in the local working directory in the VM
		
	6. Now that we have copied all the files we need on the SD card on the Pi,
		we shall connect the Raspberry Pi to our PC via Ethernet and power it
		using the USB cable.
	7. On the VM, SSH into the pi using the IP address that was set initially.
		$ ssh pi@192.168.137.56
	8. Compile all the User-Space sources that were previously copied.
		$ gcc pid_pos.c -o pid_pos
		$ gcc pid_speed.c -o pid_speed
		$ gcc encoder_pos.c -o encoder_pos
		$ gcc encoder_speed.c -o encoder_speed
	9. Switch to Super User mode by 
		$ sudo su
		So that we don't need to type 'sudo' everytime
	10. Integrate all the compiled LKMs which had been copied.
		$ insmod motor.ko
		$ insmod motor_pwm.ko
		$ insmod encoder.ko
	11. Install the spidev and PIL tools:
		Go to the folder /home/pi/spidev-3.2 and run:
		$ python setup.py installed
		Go to the folder /home/pi/Imaging-1.1.7 and run:
		$ python setup.py installed		
	12. Open another tab on the terminal and SSH into the Pi again.
		This way we shall have two tabs: one to run our user program and one
		to run the screen.py python script for the OLED screen.
	13. On the first tab, run the desired user program. For eg:
		$ ./pid_pos
	14. On the second tab, run the python script for the screen:
		$ python screen.py
	15. Following the steps 13 and 14 will run the user program for Position 
		Control using PID. The Actual and Target positions will get displayed on 
		the OLED screen on the Pi.

3. Steps to setup Startup Configuration
	1. SSH into the Raspberry Pi
		$ ssh pi@192.168.137.56
	2. While in the /home/pi folder, open the .bashrc file
		$ sudo nano .bashrc
	3. Go to the very end of the file and add the following lines:
		sudo insmod motor.ko
		sudo insmod motor_pwm.ko
		sudo insmod encoder.ko
		sudo python screen.py &
		sudo ./pid_pos
		
		We simply add the LKM modules and then run the python script for the
		OLED screen. It is important that we run this script in the background, and 
		hence the '&' following it.
		The last line indicates the user-program to be run at startup. We have just 
		added ./pid_pos as an example.
	4. Save the file and exit
	5. Reboot the pi 
		$ sudo reboot
	6. When the Pi has booted up again, and you have logged back into the Pi via SSH,
		the user-program would be running on the pi.


	
		

	