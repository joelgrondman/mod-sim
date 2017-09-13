function [x,p] = chirikov_map(x, p, K)
	p = mod((p + (K/(2*pi))*sin(2*pi*x)),1);
	x = mod(x + p,1);
end

