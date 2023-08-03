function y_t = LPF(x_t,f_c,f)
%LPF Summary of this function goes here
%   Detailed explanation goes here


X_f = fftshift(fft(x_t));
Y_f = X_f.*rect(f/(2*f_c));

y_t = ifft(ifftshift(Y_f));


end

