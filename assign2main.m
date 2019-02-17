%Punahamoa Walker and Ning Yang
%This assignment is for MUSI6202 Assignment 2
warning off
figure(1);
amplitude = 1.0; 
sampling_rate_Hz = 44100; 
frequency_Hz = 400; 
length_secs = 0.5; 
phase_radians = pi/2;
[t,x1]=generateSinusoidal(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians);
t_index=floor(0.005*sampling_rate_Hz);
plot(t(1:t_index),x1(1:t_index));
hold on

amplitude = 1.0; 
sampling_rate_Hz = 44100; 
frequency_Hz = 400; 
length_secs = 0.5; 
phase_radians = 0;
[t,x2] = generateSquare(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians);

plot(t(1:t_index),x2(1:t_index));
title('First 0.005 Seconds of generateSinusoidal and generateSquare');
ylabel('x(t)')
xlabel('t (seconds)')
legend('Sinusoid', 'Square Wave');


%Q3

%Sin wave
figure(2);
subplot(2,1,1);
[f1,XAbs1,XPhase1,XRe1,XIm1] = computeSpectrum(x1, sampling_rate_Hz);
plot(f1, XAbs1);
title('spectrum diagram of sinusoidal wave');
ylabel('magnitude of spectrum')
xlabel('frequency(Hz)')
subplot(2,1,2);
plot(f1,XPhase1);
title('phase spectra of sinusoidal wave');
ylabel('phase(radian)');
xlabel('frequency(Hz)');
%Square wave
figure(3);
subplot(2,1,1);
[f2,XAbs2,XPhase2,XRe2,XIm2] = computeSpectrum(x2, sampling_rate_Hz);
plot(f2, XAbs2);
title('spectrum diagram of square wave');
ylabel('magnitude of spectrum')
xlabel('frequency(Hz)')
subplot(2,1,2);
plot(f2,XPhase2);
title('phase spectra pf square wave');
ylabel('radian');
xlabel('frequency(Hz)');

%Q4
figure(4);
subplot(2,2,1);

[freq_vector, time_vector, magnitude_spectrogram] = mySpecgram(x2, 2048, 1024,sampling_rate_Hz , 'rect');
title('Spectrogram of myspecgram with rect window');
subplot(2,2,2);
[freq_vector, time_vector, magnitude_spectrogram] = mySpecgram(x2, 2048, 1024,sampling_rate_Hz , 'hann');
title('Spectrogram of myspecgram with hann window');
subplot(2,2,3);
spectrogram(x2,ones(2048,1),1024,2048,'yaxis');
title('spectrogram of system function with rect window');
subplot(2,2,4);
spectrogram(x2,hanning(2048), 1024, 2048, 'yaxis');
title('spectrogram of system function with hann window');

