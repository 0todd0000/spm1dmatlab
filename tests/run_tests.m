
clear;  clc

run_nonparam = true;





testCase = test_0d;
testCase.run;

testCase = test_0d_mv;
testCase.run;

testCase = test_1d;
testCase.run;

%nonparam tests:
if run_nonparam
    testCase = test_0d_np;
    testCase.run;

    testCase = test_1d_np;
    testCase.run;
end