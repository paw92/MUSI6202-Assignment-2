%Punahamoa Walker and Ning Yang
%This assignment is for MUSI6202 Assignment 2

amplitude = 1.0; 
sampling_rate_Hz = 44100; 
frequency_Hz = 400; 
length_secs = 0.5; 
phase_radians = pi/2;
[t,x]=generateSinusoidal(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians);
t_index=floor(0.005*sampling_rate_Hz);
plot(t(1:t_index),x(1:t_index));
title('First 0.005 Seconds of generateSinusoidal');
ylabel('x(t)')
xlabel('t (seconds)')

amplitude = 1.0; 
sampling_rate_Hz = 44100; 
frequency_Hz = 400; 
length_secs = 0.5; 
phase_radians = 0;
[t,x1]=generateSinusoidal(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians);
[t,x2] = generateSquare(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians);
plot(t(1:t_index),x1(1:t_index), t(1:t_index),x2(1:t_index));
title('First 0.005 Seconds of generateSinusoidal and generateSquare');
ylabel('x(t)')
xlabel('t (seconds)')
legend('Sinusoid', 'Square Wave');