%This function generates a sinsusoid
function [t,x] = generateSinusoidal(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians)
t=((1:length_secs*sampling_rate_Hz)/sampling_rate_Hz)';
x=amplitude*sin(frequency_Hz*2*pi*t'+phase_radians)';
end