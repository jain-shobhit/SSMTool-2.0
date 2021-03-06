function [prob, atlas, cseg] = flush(atlas, prob, cseg)
%FLUSH   Flush point list.
%
% Merge last successfully located chart into atlas. Use superclass flush
% function to write point list to screen and disk. Terminate when number of
% successfully completed continuation steps equals PtMX or when the atlas
% boundary is empty.
%
% Identical to atlas2d_v5.

% Copyright (C) Frank Schilder, Harry Dankowicz
% $Id: flush.m 3087 2019-04-04 19:54:09Z hdankowicz $

if cseg.Status==cseg.CurveSegmentOK
  [atlas, cseg] = atlas.merge(cseg);
end
[prob, atlas, cseg] = atlas.flush@AtlasBase(prob, cseg);
if any(cseg.Status==[cseg.CurveSegmentOK cseg.BoundaryPoint])
  if isempty(atlas.boundary) || (atlas.next_pt>atlas.cont.PtMX)
    cseg.Status = cseg.BoundaryPoint;
  else
    cseg.Status = cseg.CurveSegmentOK;
  end
end

end
