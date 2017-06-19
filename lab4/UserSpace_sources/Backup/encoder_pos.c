/**
 * @file   encoder_pos.c
 *
 * @brief  User-space program to implement naive 
 *			position control based on the encoder knob
 *
 * @date   05 Dec 2016
 * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu>  
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */

#include<stdio.h>
#include<stdlib.h>
#include<errno.h>
#include<fcntl.h>
#include<string.h>
#include<unistd.h>
 
#define RECEIVE_BUFFER_LENGTH 	6 
#define WRITE_BUFFER_LENGTH 	6

#define MOTOR_ANGLE 	1
#define ENCODER_ANGLE 	2
#define MOTOR_SPEED 	3

#define TOLERANCE 		20
#define CRAWL_SPEED		40

#define CLOCKWISE 	   1
#define ANTI_CLOCKWISE 2

int Write(int fd, char *stringToSend, size_t len);

static char receive_buffer[RECEIVE_BUFFER_LENGTH];

static char write_buffer[WRITE_BUFFER_LENGTH];

static int fd_encoder, fd_motor, fd_pwm;  

FILE *fd_tar, *fd_curr;
 
/**
 * @brief Safe wrapper for the write() function.
 *
 *
 * @return 0 if successful, error code in case of a write error.
 */
int Write(int fd, char *stringToSend, size_t len)
{
	int ret = write(fd, stringToSend, len); 
	if (ret < 0)
	{
		perror("Failed to write the message to the device.");
		return errno;
	}
	return 0;
}

/**
 * @brief Causes a delay, so that the interrupts and read/write
 *			requests don't collide 
 *
 */
void spin_wait(long delay)
{
	long i_x = 0;
	for (;i_x < delay;i_x++)
	{

	}	
}

/**
 * @brief Write a param value, such as PWM value to the LKM.
 * 		   
 *
 */
void WriteParameter(int fd, int param)
{
	memset(write_buffer,0,WRITE_BUFFER_LENGTH);
	sprintf(write_buffer,"%d", param);   		
	Write(fd,write_buffer,strlen(write_buffer)+1);	 	
}

/**
 * @brief Writes a param code to the LKM to request for
 * 		a parameter which is read subsequently and returned
 * 		   
 * @return Paramter value obtained from the LKM
 */
int getEncoderParameter(int fd_enc, int param)
{
	int res = 0;
	WriteParameter(fd_enc, param);
	
	memset(receive_buffer,0,RECEIVE_BUFFER_LENGTH);
	read(fd_enc, receive_buffer, RECEIVE_BUFFER_LENGTH);
	
	res = atoi(receive_buffer);
	return res;
} 

/**
 * @brief Initialize all the files which will be used to
 *			communicate with the LKMs
 * 		   
 * @return 0 if successful, error code in case of a write error.
 */
int init_file()
{
	fd_pwm = open("/dev/motor_pwm", O_RDWR); 
	if (fd_pwm < 0){
		perror("Failed to open motor_pwm.ko...");
		return errno;
	}
	fd_encoder = open("/dev/encoder", O_RDWR);
	if (fd_encoder < 0){
		perror("Failed to open encoder.ko...");
		return errno;
	}   

	fd_motor = open("/dev/motor", O_RDWR);
	if (fd_motor < 0){
		perror("Failed to open motor.ko...");
		return errno;
	}  	
	fd_tar  = fopen("/home/pi/tar_file", "w");
	fd_curr = fopen("/home/pi/cur_file", "w");   	   
	return 0;
}
 
/**
 * @brief Main Control routine
 * 		   
 */ 
int main(){

   int error_angle, target_speed, encoder_pos, motor_speed, direction, motor_angle;
   
   if(init_file())
	   return -1;

	while(1)
	{
	   encoder_pos = getEncoderParameter(fd_encoder,ENCODER_ANGLE);
	   encoder_pos = (encoder_pos<0)?(encoder_pos+360):encoder_pos;
	   motor_angle = getEncoderParameter(fd_encoder, MOTOR_ANGLE);
	   motor_angle = (motor_angle<0)?(motor_angle+360):motor_angle;
	   
	   error_angle = encoder_pos - motor_angle;

		if(error_angle < 0)
		{
			if(error_angle>-180)
			{
				direction = CLOCKWISE;
			}
			else
			{
				direction = ANTI_CLOCKWISE;
				error_angle = -360 - error_angle;
			}			
		}
	   else
	   {
		   if(error_angle<180)
		   {
			   direction = ANTI_CLOCKWISE;
		   }
		   else
		   {
			   direction = CLOCKWISE;
			   error_angle = 360 - error_angle;			   
		   }		   
	   }
	   
	   if((error_angle > TOLERANCE)||(error_angle < -TOLERANCE))
		   motor_speed = CRAWL_SPEED;
	   else
		   motor_speed = 0;	   

	//   printf("\n Position Read = %d, Motor Position = %d Error = %d Direction = %d", encoder_pos, motor_angle, error_angle, direction);
	   
	   WriteParameter(fd_motor, direction);
	   WriteParameter(fd_pwm, motor_speed);
	   
	  fprintf(fd_tar, "%d\n",encoder_pos);
	  fprintf(fd_curr, "%d\n", motor_angle);
	  fflush(fd_tar);
	  fflush(fd_curr);	   	   
	   
	   spin_wait(1000000);

	}
   return 0;
}