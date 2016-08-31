%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef SnPM1DiF < spm1d.stats.nonparam.snpm.SnPM1Di
    properties
        effect = 'Main A';
    end
    
    
    methods
        function [self] = SnPM1DiF(snpm, alpha, zstar, two_tailed, clusters)
            self @ spm1d.stats.nonparam.snpm.SnPM1Di(snpm, alpha, zstar, two_tailed, clusters)
        end

    end
    


   %  methods (Access = protected)
   %      function header = getHeader(self)
   %          s = self.STAT;
   %          if s == 'T'
   %              s = 't';
   %          end
   %          header = sprintf('\nSnPM{%s} inference (1D)',s);
   %      end
   %
   %      function propgrp = getPropertyGroups(self)
   %          plist = struct;
   %          plist.z           = self.z;
   %          plist.nPermUnique = self.nPermUnique;
   %          plist.alpha       = self.alpha;
   %          plist.zstar       = self.zstar;
   %          plist.h0reject    = self.h0reject;
   %          plist.p           = self.p;
   %          propgrp = matlab.mixin.util.PropertyGroup(plist);
   %      end
   %
   %
   %
   % end



end