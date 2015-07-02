function [self] = AnimalDepression()

self.www  = 'http://www.pearsonhighered.com/assets/hip/gb/uploads/Mayers_IntroStatsSPSS_Ch14.pdf';
A         = [
[36,80,50,73,48,67],
[48,93,28,87,48,50],
[61,53,44,80,87,67],
[42,53,44,62,42,50],
[55,87,48,87,42,56],
[42,60,67,67,42,56],
[48,60,67,40,36,50],
[48,98,50,90,61,49],
[53,67,44,60,61,60],
[48,93,80,93,42,48],
]; %#ok<*COMNL>
yA     = A(:,[1 4]);  %dogs
yB     = A(:,[2 5]); %cats
yC     = A(:,[3 6]);  %hamsters
self.Y    = [yA; yB; yC];
self.A    = [zeros(1,10) ones(1,10), 2*ones(1,10)]';
self.z    = 23.8481;     %computed in MATLAB using manova1
self.df   = [1, 4];
self.p    = 0.000085673; %computed in MATLAB using manova1

end
