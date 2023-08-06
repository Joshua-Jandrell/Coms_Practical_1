function modulated = DSBSC_AM(message,carrier_freq,t)
%DSBSC_AM Perform DSB-SC amplitude modulation using the given carrier
%frequency.
%   A row vector |t| of time domain values over which the modulated signal
%   is to be defined should also be provided.
%   The carrier signal used is a cosine wave.


modulated = message.*cos(2*pi*carrier_freq*t);
end

