#include<stdio.h>
#include<stdlib.h>
#include<errno.h>
#include<fcntl.h>
#include<string.h>
#include<unistd.h>
 
#define RECEIVE_BUFFER_LENGTH 	6               ///< The buffer length (crude but fine)
#define WRITE_BUFFER_LENGTH 	6

#define MOTOR_ANGLE 	1
#define ENCODER_ANGLE 	2
#define MOTOR_SPEED 	3

#define CLOCKWISE 	   	1
#define ANTI_CLOCKWISE 	2

#define Kp				0.2	//set val = 0.5
#define Kd				0.08
#define Ki				0.005 //setval = 0.007

int Write(int fd, char *stringToSend, size_t len);

static char receive_buffer[RECEIVE_BUFFER_LENGTH];     ///< The receive buffer from the LKM

static char write_buffer[WRITE_BUFFER_LENGTH];

static int fd_encoder, fd_motor, fd_pwm;  

FILE *fd_tar, *fd_curr;
 
int Write(int fd, char *stringToSend, size_t len)
{
	int ret = write(fd, stringToSend, len); // Send the string to the LKM
	   if (ret < 0){
		  perror("Failed to write the message to the device.");
		  return errno;
	   }
}

void spin_wait(long delay)
{
	long i_x = 0;
	for (;i_x < delay;i_x++)
	{

	}	
}

void WriteParameter(int fd, int param)
{
	memset(write_buffer,0,WRITE_BUFFER_LENGTH);
	sprintf(write_buffer,"%d", param);   		
	Write(fd,write_buffer,strlen(write_buffer)+1);	 	
}

int getEncoderParameter(int fd_enc, int param)
{
	int res = 0;
	WriteParameter(fd_enc, param);
	
	memset(receive_buffer,0,RECEIVE_BUFFER_LENGTH);
	read(fd_enc, receive_buffer, RECEIVE_BUFFER_LENGTH); // Receive string from the LKM  
	
	res = atoi(receive_buffer);
	return res;
} 

int init_file()
{
	   fd_pwm = open("/dev/motor_pwm", O_RDWR);             // Open the device with read/write access
	   if (fd_pwm < 0){
		  perror("Failed to open motor_pwm...");
		  return errno;
	   }
	   fd_encoder = open("/dev/encoder", O_RDWR);
	   if (fd_encoder < 0){
		  perror("Failed to open encoder...");
		  return errno;
	   }   
	   
	   fd_motor = open("/dev/motor", O_RDWR);
	   if (fd_motor < 0){
		  perror("Failed to open motor...");
		  return errno;
	   }  	
	   fd_tar  = fopen("/home/pi/tar_file", "w");
	   fd_curr = fopen("/home/pi/cur_file", "w");   	   
	   return 0;
}
 
int main(){

   int error_speed, target_speed, encoder_pos, motor_speed_read,motor_speed_write, direction;
   int error_speed_prev = 0;
   int error_sum = 0;
   motor_speed_write = 0;
   
   if(init_file())
	   return -1;	
	
	while(1)
	{
	   encoder_pos = getEncoderParameter(fd_encoder,ENCODER_ANGLE);
	   motor_speed_read = getEncoderParameter(fd_encoder,MOTOR_SPEED);
		if(encoder_pos < 0)
		{
		   direction = ANTI_CLOCKWISE;
		   target_speed = ((encoder_pos * 100) /-360);
		}
	   else
	   {
		   direction = CLOCKWISE;
		   target_speed = ((encoder_pos * 100) /360);
	   }
	   error_speed = target_speed - motor_speed_read;
	   
	 //  printf("\nTarget Speed = %d \tMotor Speed Read = %d \tError Speed = %d \t Motor Speed WRT = %d \tDirection = %d",target_speed, motor_speed_read,error_speed,motor_speed_write, direction);	   
	   
	   motor_speed_write = motor_speed_write + (int)(Kp*error_speed) + (int)(Kd*(error_speed_prev - error_speed)) + (int)(Ki*error_sum);
	   error_speed_prev = error_speed;
	   error_sum += error_speed;
	   
	   
	   if(motor_speed_write>100)
		   motor_speed_write  = 100;	   
	   if(motor_speed_write<0)
		   motor_speed_write  = 0;		   
	   
	   WriteParameter(fd_motor, direction);
	   WriteParameter(fd_pwm, motor_speed_write);
	   
	  fprintf(fd_tar, "%d\n",target_speed);
	  fprintf(fd_curr, "%d\n", motor_speed_read);
	  fflush(fd_tar);
	  fflush(fd_curr);	   
	   
	   spin_wait(10000000);

	}
   return 0;
}