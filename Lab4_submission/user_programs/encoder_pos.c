
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

#define TOLERANCE 		20
#define CRAWL_SPEED		40

#define CLOCKWISE 	   1
#define ANTI_CLOCKWISE 2

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