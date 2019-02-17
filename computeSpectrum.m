function [f,XAbs,XPhase,XRe,XIm] = computeSpectrum(x, sample_rate_Hz)

%Find period
fs = sample_rate_Hz;
N = length(x);
%Fast fourier transform
x_fft = fft(x);
x_fft = x_fft(1:N/2);

%Find magnitude, phase, real part, and imaginary part
XAbs = abs(x_fft);
XPhase = angle(x_fft);
XRe = real(x_fft);
XIm = imag(x_fft);

%frequency domain
f = (fs*(0:(N/2) - 1)/N)';

end

