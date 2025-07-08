

function [] = examine_bug(y0, y1, two_tailed)
    t     = spm1d.stats.ttest2(y1, y0).inference(0.05, 'two_tailed', two_tailed);
    tn    = spm1d.stats.nonparam.ttest2(y1, y0).inference(0.05, 'iterations', -1, 'two_tailed', two_tailed);
    tno   = spm1d.stats.nonparam_old.ttest2(y1, y0).inference(0.05, 'iterations', -1, 'two_tailed', two_tailed);

    disp( sprintf( 'zstar (param):         %.5f', t.zstar) )
    disp( sprintf( 'zstar (nonparam):      %.5f', tn.zstar) )
    disp( sprintf( 'zstar (nonparam old):  %.5f', tno.zstar) )

    figure('Position', [10 10 300 200])
    plot(t.z, 'k', 'linewidth', 3);
    hold on
    Q = numel(t.z);
    h0 = plot([0 Q-1], t.zstar*[1 1], 'k--');
    h1 = plot([0 Q-1], tn.zstar*[1 1], 'r--');
    h2 = plot([0 Q-1], tno.zstar*[1 1], 'c--', 'linewidth', 2);
    xlabel('Domain position (%)')
    ylabel('t-value')
    legend([h0 h1 h2], 'Param', 'Nonparam', 'Nonparam (old)');
end