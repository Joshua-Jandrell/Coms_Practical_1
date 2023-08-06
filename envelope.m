function env = envelope(x)
%ENVELOPE Find the time domain envelope of the given input signal using the
%Hilbert Transform .
env = abs(hilbert(x));
end

