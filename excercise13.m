%Excercise 13
count = 31;
f = @(x, y) sin((2.*x-1).^2 + 2.*y);
[X, Y] = meshgrid(x, y);
F = f(X, Y);
F2 = membrane(1,15);
result = zeros(count);
for n=1:count
    m = n;
    C1 = kkb(x, y, F, m, n);
    V1 = polyval2(C1, x, y);
    C2 = kkb(x, y, F2, m, n);
    V2 = polyval2(C2, x, y);
    result(n) = sum(abs(V1(:)-F(:)));
end
semilogy(1:count, result);