function modulated = SSBSC_AM_LSB(message,f_c,t)
%SSBSC_AM_LSB Perform SSB-SC amplitude modulation retaining the lower
%sideband.
%   A row vector |t| of time domain values over which the modulated signal
%   is to be defined should also be provided.


% Find LSB by adding Hilbert Transform  
modulated = message.*cos(2*pi*f_c*t)+ imag(hilbert(message)).*sin(2*pi*f_c*t);
end

