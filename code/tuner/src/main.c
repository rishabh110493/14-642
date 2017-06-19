/**
 * @file   main.c
 *
 * @brief  Runs the guitar tuner program in user mode. Reads the ADC via system calls and apply FFT on read signals by 
 * implementing double buffering
 *
 * @date   October 18 2016
 * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu> 
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */
 
#define NUM_SAMPLES 1600
#define SAMPLE_FREQ 1598
#define BIN_SIZE 0.999  // bin_size = sample_freq / NUM_SAMPLES


#include <unistd.h>
#include <stdio.h>
#include <kiss_fftr.h>
#include <349libc.h>
#include <math.h>

volatile kiss_fft_scalar input[NUM_SAMPLES];
volatile kiss_fft_scalar input2[NUM_SAMPLES];

kiss_fft_cpx fft_output[NUM_SAMPLES/2+1];

volatile int filled = 0;
extern int syscall_sample_adc_start(int freq, uint8_t channel, void (*fn)(uint16_t)) ;  // For use as a callback function

void sample_fn(uint16_t sample) 
{
	//To fill buffer 1
	if(filled<NUM_SAMPLES)
	{
		input[filled] = (kiss_fft_scalar) sample;
		filled++;
	}
	// To fill buffer 2
	if((filled >= NUM_SAMPLES) && (filled <= (NUM_SAMPLES*2)))
	{
		input2[filled-NUM_SAMPLES] = (kiss_fft_scalar) sample;
		filled++;
	}	
	return;
}


int main(void) 
{
	int i=0;
	// Initializing the fft config with number of samples
	kiss_fftr_cfg cfg = kiss_fftr_alloc(NUM_SAMPLES, 0, 0, 0);
	while(1)
	{
		
		sample_adc_start(SAMPLE_FREQ, 6, sample_fn);
		int end_i = (int) (330 / BIN_SIZE) + 1; // Cutoff at 330 Hz

		// Ignore the first index (the DC component of the signal)
		int max_i = 0;
		float max_val = 0;
		
		
		//read buffer 1
		while(1) //Waiting for the buffer 1 to be filled completely with samples
		{
			if(filled>NUM_SAMPLES)
				break;
		}	
		//Perform the FFT on the samples acquired
		kiss_fftr(cfg, (const kiss_fft_scalar *) input, fft_output);	
		
		// Scan through FFT output and find peak magnitude
		// Only check between certain indices to perform a "low-pass" filter	
		
		for (i = 1; i <= end_i; i++) 
		{
		// Compute the magnitude
		float val = fft_output[i].r*fft_output[i].r + fft_output[i].i*fft_output[i].i;
		if (val > max_val) 
		{
		  max_val = val;
		  max_i = i;
		}
		}	
		// Should print out a 82.5 +/- 1Hz 
		printf("Frequency: %f\n", max_i * BIN_SIZE);	
		
		max_i = 0	;
		max_val = 0;
		
		// read buffer 2
		while(1) //Waiting for the buffer 2 to be filled completely with samples
		{
			if(filled>(2*NUM_SAMPLES))
				break;
		}		
		//Perform the FFT operation on samples acquired in buffer 2
		kiss_fftr(cfg, (const kiss_fft_scalar *) input2, fft_output);
		filled = 0;

	  // Scan through FFT output and find peak magnitude
	  // Only check between certain indices to perform a "low-pass" filter

	  for (i = 1; i <= end_i; i++) {
		// Compute the magnitude
		float val = fft_output[i].r*fft_output[i].r + fft_output[i].i*fft_output[i].i;
		if (val > max_val) {
		  max_val = val;
		  max_i = i;
		}
	  }	
	  // Print out the peak frequency
	  printf("Frequency: %f\n", max_i * BIN_SIZE);  
	}
	return 0;
}