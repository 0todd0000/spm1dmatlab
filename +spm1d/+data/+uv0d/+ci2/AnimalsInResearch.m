function [self] = AnimalsInResearch()
self.www      = 'http://onlinestatbook.com/2/estimation/difference_means.html';
self.datafile = 'http://onlinestatbook.com/2/case_studies/animal_research.html';
self.YA       = [5, 5, 5, 2, 3, 7, 7, 4, 7, 5, 7, 7, 5, 3, 5, 7, 7]';
self.YB       = [3, 2, 3, 5, 6, 4, 7, 2, 6, 3, 3, 6, 5, 4, 1, 4, 2]';
self.alpha    = 0.05;
self.mu       = 0;
self.ci       = [0.29 2.65];
self.note     = 'To access the original data visit the "data file" link and select "Show Data" from the bottom of the page.';
end
