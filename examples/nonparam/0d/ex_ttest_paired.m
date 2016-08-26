

clear;  clc


%(0) Create data:
yA        = [5.7, 8.4, 6.0, 6.4, 5.5]';
yB        = [5.3, 8.2, 5.5, 6.1, 5.6]';



%(1) Conduct non-parametric test:
alpha      = 0.05;
two_tailed = true;
snpm       = spm1d.stats.nonparam.ttest_paired(yA, yB);
snpmi      = snpm.inference(alpha, 'two_tailed', two_tailed);
disp('Non-parametric results')
disp( snpmi )


%(2) Compare to parametric inference:
spm        = spm1d.stats.ttest_paired(yA, yB);
spmi       = spm.inference(alpha, 'two_tailed',two_tailed);
disp('Parametric results')
disp( spmi )





% % J = numel(y);
% %
% % % calc = spm1d.stats.nonparam.calculators.AbstractOneSample(J, mu);
% % % calc = spm1d.stats.nonparam.calculators.CalculatorTtest(J, mu);
% % % z = calc.get_test_stat(y)
% 
% perm  = spm1d.stats.nonparam.permuters.PermuterTtest0D(y, mu);
% 
% % z = perm.get_test_stat( [1 -1 1 -1 1]' )
% z = perm.get_test_stat_original();
% % perm = perm.build_pdf(-1);
% 
% % snpm = spm1d.stats.nonparam.snpm.AbstractSNPM(z, perm, false)
% % snpm = spm1d.stats.nonparam.snpm.Abstract0D(z, perm, false)
% snpm = spm1d.stats.nonparam.snpm.SnPM0D_T(z, perm, false);
% snpmi = snpm.inference(0.05)





% %(1) Conduct test using spm1d:
% spm  = spm1d.stats.ttest_paired(yA, yB);
% spmi = spm.inference(0.05, 'two_tailed', false); 
% disp(spmi)
% 
% 
% %(2) Compare to Statistics Toolbox result:
% v = ver;
% if any(strncmp('Statistics', {v.Name}, 10))
%     [h,p,ci,stats] = ttest(yA-yB);
%     [t,p] = deal(stats.tstat, 0.5*p);   %one-tailed test
%     fprintf('Statistics Toolbox results:\n')
%     fprintf('    t = %s\n', t)
%     fprintf('    p = %s\n', p)
% end

















