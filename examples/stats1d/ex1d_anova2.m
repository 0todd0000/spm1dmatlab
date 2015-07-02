    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.uv1d.anova2.Besier2009kneeflexion();
% dataset    = spm1d.data.uv1d.anova2.Dorn2012();
[Y,A,B] = deal(dataset.Y, dataset.A, dataset.B);


%(1) Conduct SPM analysis:
spmlist   = spm1d.stats.anova2(Y, A, B);
spmilist  = spmlist.inference(0.05);
FAi       = spmilist.SPMs{1};
FBi       = spmilist.SPMs{2};
FABi      = spmilist.SPMs{3};



%(2) Plot:
close all
subplot(221);  FAi.plot();  title('Main effect A')
subplot(222);  FBi.plot();  title('Main effect B')
subplot(223);  FABi.plot();  title('Interaction effect')



















