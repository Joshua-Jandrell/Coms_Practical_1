function X_f = fspect(x_t)
%FSPECT Find the double-sided Fourier Transform of time domain signal |x_f|
%   * Singal is found using the |fft| function
%   * Transformed singal is shifted using |fftshift| to provide a 
%   double-sided spectrum centred at 0Hz.
%   * Shifted signal is divided by number of samples so that amplitudes
%   scale correctly


% Find double sided fft
X_f = fft(x_t);

% Shift to center frequencies at 0Hz
X_f = fftshift(X_f);

% Scale frequency components to give correct magnitudes
X_f = X_f/size(x_t,2);
end

