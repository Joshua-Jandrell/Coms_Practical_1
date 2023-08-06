function modulated = DSBFC_AM(message,carrier_frequency,modulation_index,t)
%DSBFC_AM Perform DSB-FC amplitude modulation using the given carrier
%frequency and modulation index.
%   A row vector |t| of time domain values over which the modulated signal
%   is to be defined should also be provided.
%   The carrier signal used is a cosine wave.

% Normalize message 
message = NormalizeSignal(message);

% Find carrier signal
carrier = cos(2*pi*carrier_frequency*t);

% Find modulated signal
modulated = (1+modulation_index*message).*carrier;
end

