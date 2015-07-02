function [self] = Sweat()
self.www  = 'http://www.public.iastate.edu/~maitra/stat501/lectures/InferenceForMeans-Hotelling.pdf';
self.data = 'http://www.public.iastate.edu/~maitra/stat501/datasets/sweat.dat';
self.Y = [
[3.7, 48.5, 9.3],
[5.7, 65.1, 8.0],
[3.8, 47.2, 10.9],
[3.2, 53.2, 12.0],
[3.1, 55.5, 9.7],
[4.6, 36.1, 7.9],
[2.4, 24.8, 14.0],
[7.2, 33.1, 7.6],
[6.7, 47.4, 8.5],
[5.4, 54.1, 11.3],
[3.9, 36.9, 12.7],
[4.5, 58.8, 12.3],
[3.5, 27.8, 9.8],
[4.5, 40.2, 8.4],
[1.5, 13.5, 10.1],
[8.5, 56.4, 7.1],
[4.5, 71.6, 8.2],
[6.5, 52.8, 10.9],
[4.1, 44.1, 11.2],
[5.5, 40.9, 9.4]
]; %#ok<*COMNL>
self.mu   = [4, 50, 10];
self.z    = 9.74;
self.df   = [3, 19];
self.p    = 0.06493;
end