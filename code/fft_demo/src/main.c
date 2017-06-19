/**
 * @file   main.c
 *
 * @brief  User mode program which demonstrates peak frequency detection using FFT.
 *
 * @date   September 26 2015
 * @author Kenneth Li <kyli@andrew.cmu.edu>
 */

#include <stdio.h>
#include <kiss_fftr.h>
#include <349libc.h>
#include <math.h>

#define NUM_SAMPLES 1600
#define SAMPLE_FREQ 1598
#define BIN_SIZE .999  // bin_size = sample_freq / NUM_SAMPLES

#define PI 3.14159265 // Needed to generate demo sin wave

// Global variables for audio sample input
// We declare it as volatile because we assume the buffer is being filled in the background
volatile kiss_fft_scalar input[NUM_SAMPLES];
// Buffer for output of fft analysis
kiss_fft_cpx fft_output[NUM_SAMPLES/2+1];


/**
 * @brief User main function.
 * 
 * Generates a pure sin wave and performs an FFT on the input.
 * Then detects and prints the peak frequency.
 */
int main(void) {
  // Allocate data structures needed for KissFFT
  kiss_fftr_cfg cfg = kiss_fftr_alloc(NUM_SAMPLES, 0, 0, 0);

  // Generate the input sin wave with a frequency of 82.5 Hz,
  // with sample frequency of 4000 Hz
  int i;
  for (i = 0; i < NUM_SAMPLES; i++) {
    // input signal = sin(2pi*f*t)
    input[i] = (kiss_fft_scalar) sin(2*PI * 82.5 * i/1598);
  }

  // Perform the FFT 
  kiss_fftr(cfg, (const kiss_fft_scalar *) input, fft_output);

  // Scan through FFT output and find peak magnitude
  // Only check between certain indices to perform a "low-pass" filter
  int end_i = (int) (340 / BIN_SIZE) + 1; // Cutoff at 340 Hz

  // Ignore the first index (the DC component of the signal)
  int max_i = 0;
  float max_val = 0;
  for (i = 1; i <= end_i; i++) {
    // Compute the magnitude
    float val = fft_output[i].r*fft_output[i].r + fft_output[i].i*fft_output[i].i;
    if (val > max_val) {
      max_val = val;
      max_i = i;
    }
  }

  // Should print out a 82.5 +/- 1Hz 
  printf("Freq: %f\n", max_i * BIN_SIZE);

  return 0;
}