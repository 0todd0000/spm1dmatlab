
function [y0,y1] = gen_data(n)
    y0 = randn(n,101);
    y1 = randn(n,101) + 2*sin(0:0.1:10);
    y0 = spm1d.util.smooth(y0, 8);
    y1 = spm1d.util.smooth(y1, 8);
end