function [t, X] = generateBlocks(x, sample_rate_Hz, block_size, hop_size)
n = length(x);
bs = block_size;
hs = hop_size;
block_num = ceil((n-(bs-hs))/hs);
r = mod(n-bs,hs);
x = [x' zeros(1,r)]';
fs = sample_rate_Hz;

for i = 1:block_num
    X(:, i) = x(hs*(i-1)+1:hs*(i-1)+bs);
    t(i) = hs*(i-1)/fs;
end
t = t';

end