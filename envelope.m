function env = envelope(x)
%ENVELOPE Summary of this function goes here
%   Detailed explanation goes here

env = abs(hilbert(x));
end

