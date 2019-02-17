%This function generates a squarewave using a 10 sinusoid approximation
function [t,x] = generateSquare(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians)

x=zeros(floor(length_secs*sampling_rate_Hz)+1, 1);
for a=1:10
    [t,x1]=generateSinusoidal(1/(2*a-1), sampling_rate_Hz, (2*a-1)*frequency_Hz, length_secs, phase_radians*(2*a-1));
    x=x+(4/pi)*x1;
end

end