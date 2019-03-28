% Exercise 2.4

% Excercise 2.3
open sidonia.mat;
t = 1:1:(length(x)+1);
evalX = linspace(1, length(x)+1, 1000);
estimate = periospline(t,[x;y], evalX);
plot(estimate(1,:), estimate(2,:));