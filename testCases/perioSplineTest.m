classdef perioSplineTest < matlab.unittest.TestCase
    %PERIOSPLINETEST Summary of this class goes here
    %   Detailed explanation goes here
     methods(TestMethodSetup)
        function addPath(testCase)
            addpath('../');
        end
    end
    
   
    
    methods(Test)
        function testCoefMatrix(Test)
            x = [1 3 7 15 31];
            n = length(x)-1;
            upDiag = zeros(n-1,1);
            mainDiag = zeros(n,1);
            downDiag = zeros(n-1,1);

            for i =2:n+1
                if i == 2
                    % First one's special (used the last value)
                    upDiag(i-1) = x(i) - x(i-1); % x_1 - x_0
                    mainDiag(i-1) = 2.*((x(end) - x(end-1)) + (x(i) - x(i-1))); % 2*(x_n - x_n-1 + x_1 - x_0)
                    downDiag(i-1) = x(i) - x(i-1); % x_1 - x_0

                elseif i == n+1
                    % Other diags don't have values here
                     mainDiag(i-1) = 2.*(x(i) - x(i-2)); % 2*(x_i-1 - x_i-2 + x_i - x_i-1)
                else
                    upDiag(i-1) = x(i) - x(i-1); %x_i - x_i-1
                    mainDiag(i-1) = 2.*(x(i) - x(i-2)); % 2*(x_i-1 - x_i-2 + x_i - x_i-1)
                    downDiag(i-1) = x(i) - x(i-1); % x_i - x_i-1

                end

            end
            Coef = full(gallery('tridiag', downDiag, mainDiag, upDiag));

            % Add corner coeff to matrix
            Coef(1,end) = x(end) - x(end-1);
            Coef(end,1) = x(end) - x(end-1);
            
            Test.verifyEqual(Coef, [36 2  0 16; 2 12 4 0; 0 04 24 8; 16 0 8 48]); 
        end
    end
end

