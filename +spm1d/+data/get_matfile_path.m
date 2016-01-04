function [dir0] = get_matfile_path()

%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: get_matfile_path.m 1 2016-01-04 16:07 todd $



dir0    = fileparts( mfilename('fullpath') );
dir0    = fullfile(dir0, 'datafiles');

% switch name
%     case 'Random'
%         filename      = fullfile(dir0, 'random.mat');
% 
%     case 'SpeedKinematicsCategorical'
%         filename      = fullfile(dir0, 'ex_kinematics.mat');
% 
%     
%     
%     otherwise
%         error('Unknown matfile dataset name: %s', name)
%         
%     
% %     case 'speed-grf'
% %         if nargin==1
% %             error('specify a subject number from 0 to 9')
% %         end
% %         subj       = varargin{1};
% %         fnameX     = fullfile(dir0, 'examples', 'data', 'ex_grf_speeds.mat');
% %         fnameY     = fullfile(dir0, 'examples', 'data', sprintf('ex_grf_subj%03d.mat', subj));
% %         load(fnameX, 'x');
% %         load(fnameY, 'Y');
% %         varargout  = {Y, x(:,subj+1)};
% % 
% %     case 'speed-grf-categorical'
% %         if nargin==1
% %             error('specify a subject number from 0 to 9')
% %         end
% %         subj       = varargin{1};
% %         fnameX     = fullfile(dir0, 'examples', 'data', 'ex_grf_speeds_cond.mat');
% %         fnameY     = fullfile(dir0, 'examples', 'data', sprintf('ex_grf_subj%03d.mat', subj));
% %         load(fnameX, 'x');
% %         load(fnameY, 'Y');
% %         x          = x(:,subj+1);
% %         [Y0,Y1,Y2] = deal( Y(x==1,:), Y(x==2,:), Y(x==3,:) );
% %         varargout  = {Y0, Y1, Y2};


end
