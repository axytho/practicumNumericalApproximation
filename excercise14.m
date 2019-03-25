F = double(imread('etna.jpg'));
x = linspace(-1, 1,size(F, 2));
y = linspace(-1, 1,size(F, 1));
figure(1)
[X,Y] = meshgrid(x,y);
surf(X,Y,F,'EdgeColor','none','LineStyle','none','FaceLighting','phong')
xlim([-1,1]); ylim([-1,1]); zlim([0, 250]);
title('Etna')
figure(2)
m = 15;
n = 15;
C1 = kkb(x, y, F, m, n);
V1 = polyval2(C1, x, y);
surf(X,Y,V1,'EdgeColor','none','LineStyle','none','FaceLighting','phong')
xlim([-1,1]); ylim([-1,1]); zlim([0, 250]);
title('EtnaApproximation')