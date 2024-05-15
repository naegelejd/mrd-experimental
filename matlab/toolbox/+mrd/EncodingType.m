% This file was generated by the "yardl" tool. DO NOT EDIT.

classdef EncodingType < handle
  properties
    encoded_space
    recon_space
    encoding_limits
    trajectory
    trajectory_description
    parallel_imaging
    echo_train_length
  end

  methods
    function self = EncodingType(kwargs)
      arguments
        kwargs.encoded_space = mrd.EncodingSpaceType();
        kwargs.recon_space = mrd.EncodingSpaceType();
        kwargs.encoding_limits = mrd.EncodingLimitsType();
        kwargs.trajectory = mrd.Trajectory.CARTESIAN;
        kwargs.trajectory_description = yardl.None;
        kwargs.parallel_imaging = yardl.None;
        kwargs.echo_train_length = yardl.None;
      end
      self.encoded_space = kwargs.encoded_space;
      self.recon_space = kwargs.recon_space;
      self.encoding_limits = kwargs.encoding_limits;
      self.trajectory = kwargs.trajectory;
      self.trajectory_description = kwargs.trajectory_description;
      self.parallel_imaging = kwargs.parallel_imaging;
      self.echo_train_length = kwargs.echo_train_length;
    end

    function res = eq(self, other)
      res = ...
        isa(other, "mrd.EncodingType") && ...
        all([self.encoded_space] == [other.encoded_space]) && ...
        all([self.recon_space] == [other.recon_space]) && ...
        all([self.encoding_limits] == [other.encoding_limits]) && ...
        all([self.trajectory] == [other.trajectory]) && ...
        all([self.trajectory_description] == [other.trajectory_description]) && ...
        all([self.parallel_imaging] == [other.parallel_imaging]) && ...
        all([self.echo_train_length] == [other.echo_train_length]);
    end

    function res = ne(self, other)
      res = ~self.eq(other);
    end
  end

  methods (Static)
    function z = zeros(varargin)
      elem = mrd.EncodingType();
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