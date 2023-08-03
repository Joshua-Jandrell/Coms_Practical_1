function normalized = NormalizeSignal(signal)
%NORMALIZESIGNAL Summary of this function goes here
%   Detailed explanation goes here

% Find maximum value
max_val = max(abs(signal));
% Normalize signal
normalized = signal/max_val;
end

