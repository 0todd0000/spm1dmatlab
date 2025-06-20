function [s] = path()
    s =  mfilename('fullpath');
    s = fileparts( fileparts(s) );  % full path to spm1d's parent directory
end
