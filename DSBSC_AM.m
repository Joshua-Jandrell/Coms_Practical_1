function modulated = DSBSC_AM(message,carrier_freq,t)
%DSBSC_AM Summary of this function goes here
%   Take in message |m| and carrier |c| as function handles
%   Return modulated singal as a function handle |u|

modulated = message.*cos(2*pi*carrier_freq*t);
end

