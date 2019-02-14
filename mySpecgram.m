function [freq_vector, time_vector, magnitude_spectrogram] = mySpecgram(x,  block_size, hop_size, sampling_rate_Hz, window_type)
if window_type == 'hann'
    window = hann(block_size);
elseif window_type == 'rect' 
    window = ones(block_size, 1);
else
    error('Please enter only hann or rect for window type')
end

[t, X] = generateBlocks(x, sampling_rate_Hz, block_size, hop_size);

for i= 1:length(t)
[f,XAbs,XPhase,XRe,XIm] = computeSpectrum(window.*X(:,i), sampling_rate_Hz);
end

magnitude_spectrogram = XAbs;
freq_vector = f;
time_vector = t;

image(XAbs);

end
