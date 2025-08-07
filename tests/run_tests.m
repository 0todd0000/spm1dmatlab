
clear;  clc

run_np = true;



% testCase = test_0d;
% testCase.run;
%
%
% testCase = test_0d_mv;
% testCase.run;
%
%
% testCase = test_1d;
% testCase.run;




%nonparam tests:
if run_np
    testCase = test_0d_np;
    testCase.run;


    % testCase = test_1d_np;
    % testCase.run;
end