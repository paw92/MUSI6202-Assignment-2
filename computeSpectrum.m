function [f,XAbs,XPhase,XRe,XIm] = computeSpectrum(x, sample_rate_Hz)

%Find period
fs = sample_rate_Hz;
N = length(x);
%Fast fourier transform
x_fft = fft(x);
x_fft = x_fft(1:N/2);
% %normalizing magnitude spectrum
% P2 = abs(x_fft/N);
% P1 = P2(1:N/2);
% P1(2:end-1) = 2*P1(2:end-1);


%Find magnitude, phase, real part, and imaginary part
XAbs = abs(x_fft);
XPhase = angle(x_fft);
XRe = real(x_fft);
XIm = imag(x_fft);

%frequency domain
f = (fs*(0:((N-1)/2))/N)';

end

