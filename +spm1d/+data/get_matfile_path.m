function [dir0] = get_matfile_path()

%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky

dir0    = fileparts( mfilename('fullpath') );
dir0    = fullfile(dir0, 'datafiles');

end
