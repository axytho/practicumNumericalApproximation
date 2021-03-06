classdef kkbTest < matlab.unittest.TestCase
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    methods(TestMethodSetup)
        function addPath(testCase)
            addpath('../');
        end
    end
    
    methods(Test)
        function testBasic(testCase)
           % f = x + y
           x = [0, 1];
           y = [0, 1];
           f = @(x,y) x+y;
           F = f(x, y');
           % Our function is very simple, and the best result would be
           % C = [0, 1; 1, 0], because we want 0*1*1+1*x*1+1*1*y+0*x*y
           C = [0, 1; 1, 0];
           CFunction = kkb(x, y, F, 2, 2);
           testCase.verifyEqual(C, CFunction, 'AbsTol', 10^-15);
           V = polyval2(CFunction, x, y);
           [X, Y] = meshgrid(x, y);
           scatter3(X(:), Y(:), V(:));
           
        end
        
    end
end

