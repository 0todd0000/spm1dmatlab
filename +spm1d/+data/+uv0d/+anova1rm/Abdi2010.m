function [self] = Abdi2010()
self.cite    = 'Abdi H (2010). The Greenhouse-Geisser correction. In Neil Salkind (Ed.), Encyclopedia of Research Design. Thousand Oaks, CA: Sage. 2010';
self.www     = 'https://www.utdallas.edu/~herve/abdi-GreenhouseGeisser2010-pretty.pdf';
Y  = [
	[76, 64, 34, 26]
	[60, 48, 46, 30]
	[58, 34, 32, 28]
	[46, 46, 32, 28]
	[30, 18, 36, 28]
];
[m,n]     = size(Y);
[A,SUBJ]  = meshgrid(1:n,1:m);
self.Y    = Y(:);
self.A    = A(:);
self.SUBJ = SUBJ(:);
self.z    = 5.36;
self.df   = [3, 12];
self.p    = 0.018;
end



