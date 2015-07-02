function [varargout] = spm1d_util_get_dataset(name, varargin)

% Copyright (C) 2014  Todd Pataky
% Version: M0.1 (2014/05/01)


dir0    = fileparts( mfilename('fullpath') );


switch name
    case 'random'
        fname      = fullfile(dir0, 'examples', 'data', 'random.mat');
        load(fname, 'Y')
        varargout  = {Y}; %#ok<*NODEF>
    
    case 'speed-kinematics-categorical'
        fname      = fullfile(dir0, 'examples', 'data', 'ex_kinematics.mat');
        load(fname, 'Y')
        [Y0,Y1,Y2] = deal(Y(1:10,:), Y(11:20,:), Y(21:30,:));
        varargout  = {Y0, Y1, Y2};
    
    case 'speed-grf'
        if nargin==1
            error('specify a subject number from 0 to 9')
        end
        subj       = varargin{1};
        fnameX     = fullfile(dir0, 'examples', 'data', 'ex_grf_speeds.mat');
        fnameY     = fullfile(dir0, 'examples', 'data', sprintf('ex_grf_subj%03d.mat', subj));
        load(fnameX, 'x');
        load(fnameY, 'Y');
        varargout  = {Y, x(:,subj+1)};

    case 'speed-grf-categorical'
        if nargin==1
            error('specify a subject number from 0 to 9')
        end
        subj       = varargin{1};
        fnameX     = fullfile(dir0, 'examples', 'data', 'ex_grf_speeds_cond.mat');
        fnameY     = fullfile(dir0, 'examples', 'data', sprintf('ex_grf_subj%03d.mat', subj));
        load(fnameX, 'x');
        load(fnameY, 'Y');
        x          = x(:,subj+1);
        [Y0,Y1,Y2] = deal( Y(x==1,:), Y(x==2,:), Y(x==3,:) );
        varargout  = {Y0, Y1, Y2};


end
