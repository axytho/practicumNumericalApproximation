% Excercise 12
x = linspace(-1, 1, 31);
y = linspace(-1, 1, 31);
% I guess I can also use a meshgrid but it really isn't
% necessary since you can just call functionBasic(x, y')
% and it will perform the space action
m = 1;
n = 1;
[X, Y] = meshgrid(x, y);
f = @(x, y) sin((2.*x-1).^2 + 2.*y);
F = f(X, Y);
C1 = kkb(x, y, F, m, n);
V1 = polyval2(C1, x, y);
figure(1)
surf(X, Y, F);
hold on
scatter3(X(:), Y(:), V1(:));     
hold off

F2 = membrane(1,15);
C2 = kkb(x, y, F2, m, n);
V2 = polyval2(C2, x, y);
figure(2)
scatter3(X(:), Y(:), V2(:));
hold on
surf(X, Y, F2);



