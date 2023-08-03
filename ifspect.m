function x_t = ifspect(X_f)
%IFSPECT Summary of this function goes here
%   Detailed explanation goes here

x_t = ifft(ifftshift(X_f))*size(X_f,2);
end

