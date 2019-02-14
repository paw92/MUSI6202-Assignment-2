close all
%Punahamoa Walker and Ning Yang
%This assignment is for MUSI6202 Assignment 2

%Part 1 Generating Sinusoids
amplitude = 1.0; 
sampling_rate_Hz = 44100; 
frequency_Hz = 400; 
length_secs = 0.5; 
phase_radians = pi/2;
[t,x]=generateSinusoidal(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians);
t_index=floor(0.005*sampling_rate_Hz);
plot(t(1:t_index),x(1:t_index));
title('Part 1: First 0.005 Seconds of generateSinusoidal');
ylabel('x(t)')
xlabel('t (seconds)')

%Part 2 Generating a square wave
amplitude = 1.0; 
sampling_rate_Hz = 44100; 
frequency_Hz = 400; 
length_secs = 0.5; 
phase_radians = 0;
figure
[t,x1] = generateSquare(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians);
plot(t(1:t_index),x(1:t_index), t(1:t_index),x1(1:t_index));
title('Part 2: First 0.005 Seconds of generateSinusoidal and generateSquare');
ylabel('x(t)')
xlabel('t (seconds)')
legend('Sinusoid', 'Square Wave');

%Part 3 Fourier Transform
x=[x; zeros(22050,1)];
x1=[x1; zeros(22050,1)];
[f,XAbs,XPhase,XRe,XIm] = computeSpectrum(x, sampling_rate_Hz);
[f1,XAbs1,XPhase1,XRe1,XIm1] = computeSpectrum(x1, sampling_rate_Hz);
figure
subplot(2,1,1)
plot(f,XAbs)
title('Part 3: Sine wave')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
subplot(2,1,2)
plot(f,XPhase)
xlabel('Frequency (Hz)')
ylabel('Phase (Degrees)')

figure
subplot(2,1,1)
plot(f1,XAbs1)
title('Part 3: Square wave approximation')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
subplot(2,1,2)
plot(f,XPhase)
xlabel('Frequency (Hz)')
ylabel('Phase (Degrees)')