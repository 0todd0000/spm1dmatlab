function [extents,heights] = cluster_geom(z, u)

b       = z >= u;
[L,n]   = spm1d.geom.bwlabel(b);
extents = zeros(1,n);
heights = zeros(1,n);
for i=1:n
    extents(i) = sum(L==i)-1+eps;
    heights(i) = min( z(L==i) );
end




