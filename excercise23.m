% Excercise 2.3
[x,y] = click(); % Gives us x_1 to x_n-1 and y_1 to y_n-1
                  %x_n = x_1 and y_n = y_1, this happens implicitly in
                  %periospline
                  
t = 1:1:(length(x)+1);
evalX = linspace(1, length(x)+1, 1000);
estimate = periospline(t,[x;y], evalX);
plot(estimate(1,:), estimate(2,:));