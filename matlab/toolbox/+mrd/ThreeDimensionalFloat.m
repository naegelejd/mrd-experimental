% This file was generated by the "yardl" tool. DO NOT EDIT.

classdef ThreeDimensionalFloat < handle
  properties
    x
    y
    z
  end

  methods
    function self = ThreeDimensionalFloat(kwargs)
      arguments
        kwargs.x = single(0);
        kwargs.y = single(0);
        kwargs.z = single(0);
      end
      self.x = kwargs.x;
      self.y = kwargs.y;
      self.z = kwargs.z;
    end

    function res = eq(self, other)
      res = ...
        isa(other, "mrd.ThreeDimensionalFloat") && ...
        isequal(self.x, other.x) && ...
        isequal(self.y, other.y) && ...
        isequal(self.z, other.z);
    end

    function res = ne(self, other)
      res = ~self.eq(other);
    end
  end

  methods (Static)
    function z = zeros(varargin)
      elem = mrd.ThreeDimensionalFloat();
      if nargin == 0
        z = elem;
        return;
      end
      sz = [varargin{:}];
      if isscalar(sz)
        sz = [sz, sz];
      end
      z = reshape(repelem(elem, prod(sz)), sz);
    end
  end
end
