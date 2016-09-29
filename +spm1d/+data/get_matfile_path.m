function [dir0] = get_matfile_path()

%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky

dir0    = fileparts( mfilename('fullpath') );
dir0    = fullfile(dir0, 'datafiles');

end
