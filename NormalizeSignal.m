function normalized = NormalizeSignal(signal)
%NORMALIZESIGNAL Normalise the input signal so that its amplitude
%(maximum value) is 1

% Find maximum value
max_val = max(abs(signal));
% Normalize signal
normalized = signal/max_val;
end

