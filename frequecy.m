function f = frequecy(x_t)
%FREQUECY Summary of this function goes here
%   Detailed explanation goes here

samples = size(x_t,2);
ft = fft(x_t)/samples; 

for i = 1:size(x)
    if(abs(ft(i))) > 0
        f = f(i);
        return
    end
end
end

