%Excercise 13
count = 20;
f = @(x, y) sin((2.*x-1).^2 + 2.*y);
[X, Y] = meshgrid(x, y);
F = f(X, Y);
F2 = membrane(1,15);
result1 = zeros(count);
result2 = zeros(count);
for n=1:count
    m = n;
    C1 = kkb(x, y, F, m, n);
    V1 = polyval2(C1, x, y);
    C2 = kkb(x, y, F2, m, n);
    V2 = polyval2(C2, x, y);
    result1(n) = sum((V1(:)-F(:)).^2);
    result2(n) = sum((V2(:)-F2(:)).^2);
end
semilogy(1:count, result1, 1:count, result2);
xlabel("m and n value")
ylabel("Cost Function")
legend("y = sin((2x-1)²+2y)", "membrane function")