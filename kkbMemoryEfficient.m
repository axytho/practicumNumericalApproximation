function C = kkbMemoryEfficient(x, y, F, m, n)
% kkb: calculates C = B^(+) * F * (A^(+))'
% PREAMBLE: ^(+) is simply written as \ in MATLAB (psuedo inverse)
% INPUT: x vector with size(x, 2) = m and y vector with size(x,2)
Afull = fliplr(vander(x));
Bfull = fliplr(vander(y));
C =  Bfull(:, 1:n)\F*pinv((Afull(:, 1:m)))'; %m columns so we can multiply with x
end