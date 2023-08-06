function [t,f] = make_t_f(tspan, sample_freq)
%MAKE_T_F Create corresponding time and frequency domain arrays |t| and |f|
%with the given time domain value span and sampling frequency.
%   |t| and |f| arrays will be created so that the MATLAB |fft| function
%   will accurately map signals from one domain into the other.
%
%   |tspan| is a row vector contining initial and final time values.
%
%   |sample_freq| is the sampling frequency, frequency components up to 
%   (but not including) the Nyquist frequency (0.5*s_freq) will be
%   accurately represented. 

% Create time value array
t_step = 1/sample_freq; % Find time step size
t = tspan(1):t_step:tspan(2)-t_step; 

% Create correspoding frequecy value array
samples = size(t,2);    % Find number of samples
f = (-0.5*samples:0.5*samples-1)*sample_freq/samples;

end

