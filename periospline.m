function y = periospline(x,f,t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    n = length(x)-1;
    [d,~] = size(f);
    N = length(t);
    y = zeros(N, d);
    f = f';
    
    % Setup matrix & right hand side to determine s''(x_i)
    upDiag = zeros(n-1,1);
    mainDiag = zeros(n,1);
    downDiag = zeros(n-1,1);
    RHS = zeros(n,d);
    
    for i =2:n+1
        if i == 2
            % First one's special (used the last value)
            upDiag(i-1) = x(i) - x(i-1); % x_1 - x_0
            mainDiag(i-1) = 2.*((x(end) - x(end-1)) + (x(i) - x(i-1))); % 2*(x_n - x_n-1 + x_1 - x_0)
            downDiag(i-1) = x(i) - x(i-1); % x_1 - x_0
            
            RHS(i-1,:) = ((f(i,:) - f(i-1,:))./(x(i) - x(i-1))) - ((f(i-1,:) - f(end,:))./(x(end)-x(end-1))); %f_n = f_0, f_n-1 = f(end)
 
        elseif i == n+1
            % Other diags don't have values here
             mainDiag(i-1) = 2.*(x(i) - x(i-2)); % 2*(x_i-1 - x_i-2 + x_i - x_i-1)
             RHS(i-1,:) = ((f(1,:) - f(end,:))./(x(i) - x(i-1))) - ((f(end,:) - f(end-1,:))./(x(i-1)-x(i-2))); %f_n = f_0, f_n-1 = f(end)

        else
            upDiag(i-1) = x(i) - x(i-1); %x_i - x_i-1
            mainDiag(i-1) = 2.*(x(i) - x(i-2)); % 2*(x_i-1 - x_i-2 + x_i - x_i-1)
            downDiag(i-1) = x(i) - x(i-1); % x_i - x_i-1

            RHS(i-1,:) = ((f(i,:) - f(i-1,:))./(x(i) - x(i-1))) - ((f(i-1,:) - f(i-2,:))./(x(i-1)-x(i-2))); %f_n = f_0, f_n-1 = f(end)

        end
        
    end
    Coef = full(gallery('tridiag', downDiag, mainDiag, upDiag));
    
    % Add corner coeff to matrix
    Coef(1,end) = x(end) - x(end-1);
    Coef(end,1) = x(end) - x(end-1);
    RHS = 6.*RHS;
    
    % Solve all at once. This gives us the s''(x_i) for each function set
    % This is a matrix where each row gives us the s''(x_i) for a function set 
    % s''(x_0) to s''(x_n-1), s''(x_n) = s''(x_0)
    SCoef = (Coef\RHS);
    
    % For each p_i(x) determine c_1i & c_2i and put in array
    % We use a matrix where each colomn for one function set => n x d
    C1 = zeros(n, d);
    C2 = zeros(n, d);    
    for i =2:n+1
        if i == n+1
            C1(i-1, :) = f(1, :)./(x(i) - x(i-1)) - (x(i) - x(i-1))./6.0.*SCoef(1, :);            
        else
            C1(i-1, :) = f(i, :)./(x(i) - x(i-1)) - (x(i) - x(i-1))./6.0.*SCoef(i, :);
        end
        C2(i-1, :) = f(i-1, :)./(x(i) - x(i-1)) - (x(i) - x(i-1))./6.0.*SCoef(i-1, :);
    end
    % For eval determine in which interval the point lies, and use the
    % according p_i(x) (valid in interval [x_i-1, x_i])      
    
    % Search in which interval the given x-val lies: use modulo to get in
    % the base period
    for i = 1:N
       x_i = 2; % The top of the interval t(i) is in
       funcNum = 1; % The number of the spline function
       while(x_i < n+1) && (~(t(i) < x(x_i)) && (t(i)>x(x_i-1)))
           x_i = x_i + 1;
           funcNum = funcNum + 1;
       end           
       if x_i == n+1
           s_i = 1;
       else
           s_i = x_i;
       end
       
       y(i, :) = ((t(i) - x(x_i-1)).^3)./(6.0.*(x(x_i) - x(x_i-1))).*SCoef(s_i, :)...
           - ((t(i) - x(x_i)).^3)./(6.0.*(x(x_i) - x(x_i -1))).*SCoef(x_i-1, :)...
           + C1(funcNum, :).*(t(i) - x(x_i-1)) + C2(funcNum, :).*(x(x_i) - t(i));
    end    
   y = y';
end

