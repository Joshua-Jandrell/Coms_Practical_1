function [t,f] = make_t_f(t_0, t_f, sample_freq)
%MAKE_T_F Summary of this function goes here
%   Detailed explanation goes here

% Create time value array
t_step = 1/sample_freq; % Find time step size
t = t_0:t_step:t_f-t_step; 

% Create correspoding frequecy value array
samples = size(t,2);    % Find number of samples
f = (-0.5*samples:0.5*samples-1)*sample_freq/samples;

end

