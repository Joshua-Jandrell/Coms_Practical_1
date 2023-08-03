function rect_x = rect(x)
%RECT Summary of this function goes here
%   Detailed explanation goes here

rect_x = unitstep(x+0.5).*unitstep(-x+0.5);

end

