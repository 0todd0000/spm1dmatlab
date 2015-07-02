function [self] = Imacelebrity()
self.www      = 'http://discoveringstatistics.com/docs/repeatedmeasures.pdf';
Y  = [
	[8, 7, 1, 6]
	[9, 5, 2, 5]
	[6, 2, 3, 8]
	[5, 3, 1, 9]
	[8, 4, 5, 8]
	[7, 5, 6, 7]
	[10, 2, 7, 2]
	[12, 6, 8, 1]
];
[m,n]     = size(Y);
[A,SUBJ]  = meshgrid(1:n,1:m);
self.Y    = Y(:);
self.A    = A(:);
self.SUBJ = SUBJ(:);
self.z     = 3.794;
self.df    = [3, 21];
self.p     = 0.026;

