classdef kkbTest < matlab.unittest.TestCase
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        functionBasic
    end
    
    methods(TestMethodSetup)
        function loadParams(testCase)
            testCase.functionBasic = @(x,y) x+y;
        end
    end
    
    methods(Test)
        function testBasic(testCase)
           % f = x + y
           x = [0, 1];
           y = [0, 1];
           F = testCase.functionBasic(x, y');
           % Our function is very simple, and the best result would be
           % C = [0, 1; 1, 0], because we want 0*1*1+1*x*1+1*1*y+0*x*y
           C = [0, 1; 1, 0];
           CFunction = kkb(x, y, F);
           testCase.verifyEqual(C(:), CFunction);
        end
    end
end

