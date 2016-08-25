function [self] = WebsterSleep()
self.www   = 'http://faculty.webster.edu/woolflm/ci.html';
self.Y     = [4.5, 22, 7, 14.5, 9, 9, 3.5, 8, 11, 7.5, 18, 20, 7.5, 9, 10.5, 15, 19, 2.5, 5, 9, 8.5, 14, 20, 8]';
self.alpha = 0.05;
self.ci    = [8.50, 13.33];
self.note  = 'The expected CI may be slightly incorrect due to rounding errors.';
end


		