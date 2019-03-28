plotval = linspace(-pi, pi, 1000);
plotval2 = linspace(pi, 3*pi, 1000);
x = linspace(-pi, pi, 10);
x2 = linspace(pi, 3*pi, 10);
t = linspace(-pi, pi, 2000);
t2 = linspace(pi, 3*pi, 2000);

func = @(x) sin(x);

yplotval = func(plotval);
yplotval2 = func(plotval2);
f = func(x(1:end-1));
f2 =func(x2(1:end-1)); 
yEst = periospline(x,f,t);
yEst2 = periospline(x2,f2,t2);
close;
plot(plotval, yplotval, 'b');
hold on;
plot(plotval2, yplotval2, 'b');
plot(x(1:end-1), f, 'ro')
plot(t, yEst, 'go');
plot(t2, yEst2,'go');
hold off;
