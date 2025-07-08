function verifyPvalue(testCase, p, p_expected, tol)
    if iscell(p_expected)
        p_expected = p_expected{1};
    end
    if ischar(p_expected)
        switch p_expected
            case '<0.05'
                testCase.verifyTrue(p < 0.05);
            case '<0.01'
                testCase.verifyTrue(p < 0.01);
            case '<0.001'
                testCase.verifyTrue(p < 0.001);
            case '>0.05'
                testCase.verifyTrue(p > 0.05);
            otherwise
                error( sprintf('unknown p case: "%s"', p_expected))
        end
    else
        testCase.verifyEqual(p, p_expected, AbsTol=tol);
    end
end
