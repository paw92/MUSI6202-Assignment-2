function [freq_vector, time_vector, magnitude_spectrogram] = mySpecgram(x,  block_size, hop_size, sampling_rate_Hz, window_type)
if window_type == 'hann'
    window = hann(block_size);
elseif window_type == 'rect' 
    window = ones(block_size, 1);
else
    error('Please enter only hann or rect for window type')
end

[t, X] = generateBlocks(x, sampling_rate_Hz, block_size, hop_size);

magnitude_spectrogram = zeros(block_size/2, length(t));

for i= 1:length(t)
[f,magnitude_spectrogram(:, i),XPhase,XRe,XIm] = computeSpectrum(window.*X(:,i), sampling_rate_Hz);
end

freq_vector = f;
time_vector = t;
fs = sampling_rate_Hz;
magnitude_spectrogram = 10*log10(magnitude_spectrogram+eps);
hndl = imagesc((t+t(2))*fs, f*2/fs, magnitude_spectrogram);
hndl.Parent.YDir = 'normal';
h = colorbar;
xlabel('Samples');
ylabel('Nomalized frequency (x \pi rad/sample)');

end
