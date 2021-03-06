function [prob, atlas, cseg, correct] = predict(atlas, prob, cseg) %#ok<INUSD>
%PREDICT   Compute predictor.
%
% Construct curve segment projection condition and pseudo-arclength
% predictor and correct.

% Copyright (C) Frank Schilder, Harry Dankowicz
% $Id: predict.m 3087 2019-04-04 19:54:09Z hdankowicz $

chart        = atlas.base_chart;
s            = chart.G*chart.s;
nrms         = norm(s);
h            = chart.R*nrms;
s            = s/nrms;
prcond       = struct('x', chart.x, 'TS', chart.TS, 's', s, 'h', h);
xp           = chart.x + h*chart.TS*s;
[prob, cseg] = CurveSegment.create(prob, chart, prcond, xp);
correct      = true;

end
