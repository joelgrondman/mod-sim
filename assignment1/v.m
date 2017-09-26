function [vv] = v(x, K)
    vv = (K/((2*pi)^2))*(1-cos(2*pi*x));
end