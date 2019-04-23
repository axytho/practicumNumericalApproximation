% Excercise 2.2
plotval = linspace(-pi, pi, 1000);
x = linspace(-pi, pi, 20);
t = linspace(-pi, pi, 200);

func = @(x) sin(x) + sin(4.*x)./2;

yplotval = func(plotval);
f = func(x(1:end-1));

yEst = periospline(x,f,t);
close all;
plot(plotval, yplotval);
hold on;
plot(x(1:end-1), f, 'ro')
plot(t, yEst, '-go');
title('Spline Approximation for 20 abscisses')
xlabel('x');
ylabel('y')
hold off;

x1 = linspace(-pi,pi ,10);
f1 = func(x1(1:end-1));
yEst1 = periospline(x1,f1,t);
figure;
plot(t, abs(func(t)-yEst1));
title('x=10');
xlabel('x');
ylabel('error')

x2 = linspace(-pi,pi ,20);
f2 = func(x2(1:end-1));
yEst2 = periospline(x2,f2,t);
figure;
plot(t, abs(func(t)-yEst2));
title('x=20');
xlabel('x');
ylabel('error')

errMax = zeros(1,498);
index = 1;
for i=3:500
    x = linspace(-pi,pi ,i);
    f = func(x(1:end-1));
    yEst = periospline(x,f,t);
    errMax(index) = max(abs(func(t)-yEst));
    index = index + 1;    
end
figure;
semilogy(3:500, errMax);
title('Maximale fout, in functie van het aantal abscissen');
xlabel('aantal abscissen');
ylabel('maximale fout');