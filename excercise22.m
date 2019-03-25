% Excercise 2.2
plotval = linspace(-pi, pi, 1000);
x = linspace(-pi, pi, 50);
t = linspace(-pi, pi, 200);

func = @(x) sin(x) + sin(4.*x)./2;

yplotval = func(plotval);
f = func(x(1:end-1));

yEst = periospline(x,f,t);
close;
plot(plotval, yplotval);
hold on;
plot(x(1:end-1), f, 'ro')
plot(t, yEst, '-go');
hold off;

x1 = linspace(-pi,pi ,10);
f1 = func(x1(1:end-1));
yEst1 = periospline(x1,f1,t);
figure;
plot(t, abs(func(t)-yEst1));
title('x=10');

x2 = linspace(-pi,pi ,50);
f2 = func(x2(1:end-1));
yEst2 = periospline(x2,f2,t);
figure;
plot(t, abs(func(t)-yEst2));
title('x=50');

errMax = zeros(1,50);
index = 1;
for i=10:10:500
    x = linspace(-pi,pi ,i);
    f = func(x(1:end-1));
    yEst = periospline(x,f,t);
    errMax(index) = max(abs(func(t)-yEst));
    index = index + 1;    
end
figure;
plot(10:10:500, errMax);
title('MaxErr');