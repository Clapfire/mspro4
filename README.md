# mspro4
Semester project for embedded semester 4, group 4

The 4th semester project is based on using real time digital signal processing systems in System on Chips (SoC) together with high speed data acquisition from analog/digital sensors or high speed control of actuators. To fulfill this purpose, each group was given a Zedboard and asked to design a system using the built-in FPGA. The system should utilize the properties of the FPGA, especially the very fast processing.

Group 4 decided to create an audio visualizer using a 64x64 led matrix panel. (A similar board can be found from Adafruit https://www.adafruit.com/product/3649). The Adafruit Arduino program for the 32x32 panel was analyzed and adapted to work with the 64x64 matrix. The Arduino is obviously not fast enough to create gradient colors using PWM, so work began on the Zedboard.

The initial implementation used hardcoded images and displayed it on the panel.

The final implementation uses the audio input on the Zedboard, and displays a waveform based on the amplitude of the signal. The sampling frequency can be adjusted from ~95Hz to 48KHz using an encoder PMOD in the JC1 slot. The colors can be adjusted by turning on switch 4, and then using an encoder PMOD in the JD1 slot. Slots JA1 and JB1 use a custom dual PMOD board for logic shifting, before outputting signals to the board.
