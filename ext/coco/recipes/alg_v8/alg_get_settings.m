function data = alg_get_settings(prob, tbid, data)
%ALG_GET_SETTINGS   Read 'alg' toolbox instance settings.
%
% Merge user-supplied toolbox settings with default values.
%
% Identical to alg_v7.
%
% DATA = ALG_GET_SETTINGS(PROB, TBID, DATA)
%
% PROB - Continuation problem structure.
% TBID - Toolbox instance identifier.
% DATA - Toolbox data structure.

% Copyright (C) Frank Schilder, Harry Dankowicz
% $Id: alg_get_settings.m 2839 2015-03-05 17:09:01Z fschild $

defaults.norm = false; % Do not append Euclidean norm to bifurcation data
defaults.FO   = 'regular'; % Locate fold points using a nonembedded monitor function
data.alg = coco_merge(defaults, coco_get(prob, tbid));
assert(islogical(data.alg.norm), ...
  '%s: input for ''norm'' option is not boolean', tbid);
assert(ischar(data.alg.FO), ...
  '%s: input for ''FO'' option is not a string', tbid);

end
