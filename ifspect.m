function x_t = ifspect(X_f)
%IFSPECT Convert a scaled doubled sided frequency spectrum |X_f| into a 
%time domain signal
%   This function is the invers of |fspect|

% Unshift, find invers Fourier Transform and multiply by number of samples
x_t = ifft(ifftshift(X_f))*size(X_f,2);
end

