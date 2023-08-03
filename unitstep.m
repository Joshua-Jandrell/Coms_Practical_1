function u = unitstep(t)
%UNITSTEP Summary of this function goes here
%   Detailed explanation goes here

u = zeros(size(t));
for i = 1:size(t,2)
    if t(i) >= 0
        u(i) = 1;
    end
end


end

