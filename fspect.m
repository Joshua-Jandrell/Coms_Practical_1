function X_f = fspect(x_t)
%FSPECT Summary of this function goes here
%   Detailed explanation goes here

% Find double sided fft
X_f = fft(x_t);

% Shift to center frequencies correctly
X_f = fftshift(X_f);

% Scale frequency componentes to give correct magnitudes
X_f = X_f/size(x_t,2);
end

