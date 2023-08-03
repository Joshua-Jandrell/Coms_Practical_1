function modulated = DSBFC_AM(message,f_c,t,modulation_index)
%DSBFC_AM Summary of this function goes here
%   Detailed explanation goes here

% Normalize message 
message = NormalizeSignal(message);
% Find modulated signal
modulated = (1+modulation_index*message).*cos(2*pi*f_c*t);
end

