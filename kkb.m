function C = kkb(x, y, F)
% kkb: calculates C = B^(+) * F * (A^(+))'
% PREAMBLE: ^(+) is simply written as \ in MATLAB (psuedo inverse)
% INPUT: x vector with size(x, 2) = m and y vector with size(x,2)
% VALUES INSIDE: A/B: takes x/y values as column vectors and raises them
% to the power of the column where they are
C = kron(fliplr(vander(x)),fliplr(vander(y)))\F(:);
end