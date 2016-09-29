function [results] = parse_args(testname, varargin)
% Copyright (C) 2016 Todd Pataky



if isequal(testname, 'onesample')
    datum         = 'mean';
    criterion     = 'mu';
    parser        = inputParser;
    addOptional(parser, 'mu', 0, @isnumeric);
    addOptional(parser, 'iterations', -1, @isnumeric);
    parser.parse(varargin{:});
    mu            = parser.Results.mu;
    iterations    = parser.Results.iterations;

else  %paired or two-sample
    parser        = inputParser;
    addOptional(parser, 'datum', 'difference', @(x)( ischar(x) && ismember(x, {'difference','meanA'}) )  );
    addOptional(parser, 'mu', 0, @(x)( isnumeric(x) || ismember(x, {'meanB','tailB'}) )  );
    addOptional(parser, 'iterations', -1, @isnumeric);
    parser.parse(varargin{:});
    datum         = parser.Results.datum;
    mu            = parser.Results.mu;
    iterations    = parser.Results.iterations;
    if isequal(datum, 'difference')
        if ~isnumeric(mu)
            error('If datum is "difference", mu must be a numeric datum.')
        end
        criterion = 'mu';
    elseif isequal(datum, 'meanA')
        if isnumeric(mu)
            error('If datum is "meanA", mu must either "meanB" or "tailB".')
        end
        criterion = mu;
        mu        = 0;
    end
end
    


results = struct('datum',datum, 'criterion',criterion, 'mu',mu, 'iterations', iterations);

