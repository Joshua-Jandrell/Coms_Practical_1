function modulated = SSBSC_AM_LSB(message,f_c,t)
%SSBSC_AM_LSB Summary of this function goes here
%   Detailed explanation goes here

modulated = message.*cos(2*pi*f_c*t) + imag(hilbert(message)).*sin(2*pi*f_c*t);
end

