function [clusters] = cluster_geom(Z, u, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: cluster_geom.m 1 2016-01-04 16:07 todd $

% parse inputs
parser = inputParser;
addOptional(parser, 'interp',    true, @(x)islogical(x) && isscalar(x));
addOptional(parser, 'circular',  true, @(x)islogical(x) && isscalar(x));
addOptional(parser, 'csign',       +1, @(x)isscalar(x));
addOptional(parser, 'nonparam', false, @(x)islogical(x) && isscalar(x));
parser.parse(varargin{:});
interp   = parser.Results.interp;
circular = parser.Results.circular;
csign    = parser.Results.csign;
nonparam = parser.Results.nonparam;




% whole-continuum geometry:
Q        = numel(Z);               %number of continuum nodes
X        = 0:Q-1;                  %continuum position
IND      = 1:Q;                    %continuum position indices
B        = Z >= u;                 %binary upcrossings continuum
[L,n]    = spm1d.geom.bwlabel(B);  %labeled clusters



% assemble clusters
clusters = cell(1,n);
for i=1:n
    b               = L==i;             %binary continuum for i-th cluster
    [x,z]           = deal(X(b), Z(b)); %x positions and height profile
    ind             = IND(b);           %continuum indices
    %interpolate to threshold u using similar triangles method
    %(interpolate for plotting whether or not "interp" is true)
    if ( ind(1)~=1 ) && ~isnan( Z(ind(1)-1) )  %first cluster point not continuum edge && previous point not outside ROI
        [z0,z1] = deal( Z(ind(1)-1), Z(ind(1)) );
        dx      = (z1 - u) / (z1-z0);
        x       = [x(1)-dx x]; %#ok<AGROW>
        z       = [u z];       %#ok<AGROW>
    end
    if ( ind(end)~=Q ) && ~isnan( Z(ind(end)+1) )  %last cluster point not continuum edge && next point not outside ROI
        [z0,z1] = deal( Z(ind(end)), Z(ind(end)+1) );
        dx      = (z0 - u) / (z0-z1);
        x       = [x  x(end)+dx]; %#ok<AGROW>
        z       = [z  u];         %#ok<AGROW>
    end
    if nonparam
        clusters{i}   = spm1d.geom.ClusterNP(x, csign*z, csign*u, interp);
    else
        clusters{i}   = spm1d.geom.Cluster(x, csign*z, csign*u, interp);
    end
end


%merge clusters if necessary:
if circular
    xy  = zeros(n,2);
    for i = 1:n
        xy(i,:) = clusters{i}.endpoints;
    end
    [i0,i1] = deal( xy(:,1)==0,  xy(:,2)==Q-1 );
    [ind0,ind1] = deal( find(i0,1), find(i1,1) );
    if ~isempty(ind0) && ~isempty(ind1)
        if (ind0~=ind1) && (clusters{ind0}.csign==clusters{ind1}.csign)
            clusters{ind0} = clusters{ind0}.merge( clusters{ind1} );
            clusters = clusters(~i1);
        end
    end
end
    






