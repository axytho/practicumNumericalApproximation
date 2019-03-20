function C = kkb(x, y, F)
% kkb: calculates C = B^(+) * F * (A^(+))'
% PREAMBLE: ^(+) is simply written as \ in MATLAB (psuedo inverse)
% INPUT: x vector with size(x, 2) = m and y vector with size(x,2)
% VALUES INSIDE: A/B: takes x/y values as column vectors and raises them
% to the power of the column where they are (i.e. standard Vandermonde
% matrix) MATLAB flips these for some reason which is why we use fliplr
% The magic then happens because kron(A, B)*F(:) = B*F*A' but we want
% B and A inversed so we add an inverse to kron(A, B)
C = kron(fliplr(vander(x)),fliplr(vander(y)))\F(:);
end