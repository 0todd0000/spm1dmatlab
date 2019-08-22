
clear;  clc

%load data
load('data2d.mat', 'Y')



%flatten 2D arrays
[J,q0,q1] = size(Y);
Q         = q0 * q1;
y         = zeros(J, Q);
for i = 1:J
    y(i,:) = reshape( Y(i,:,:), 1, [] );
end



%remove zero-variance nodes
yA        = y( 1:10,:,:);
yB        = y(10:20,:,:);
iA        = std(yA, [], 1) > eps;
iB        = std(yB, [], 1) > eps;
i         = iA & iB;

ynz       = y(:,i);
ynzA      = ynz( 1:10,:);
ynzB      = ynz(11:20,:);



%run statistical analysis
snpm      = spm1d.stats.nonparam.ttest2(ynzA, ynzB);
snpmi     = snpm.inference(0.05, 'two_tailed', true, 'iterations', 1000);



%organize resultsfor plotting
znz       = snpmi.z;
zstar     = snpmi.zstar;
z         = zeros(1,Q);
z(i)      = znz;

Z         = reshape(z, [q0 q1]);
Zi        = Z;
Zi(abs(Z)<zstar) = 0;
ZZ        = [Z Zi];


%plot
ZZ(abs(ZZ)<eps) = nan;
close all
h = pcolor(ZZ);
colormap( jet )
caxis([-15 15])
set(h, 'edgecolor', 'none');
cbh = colorbar;
cbh.Label.String = 't value';
title('SPM results')
text(16, 10, 'Raw SPM', 'horizontalalignment', 'center')
text(48, 10, 'Inference',  'horizontalalignment', 'center')
axis image 

