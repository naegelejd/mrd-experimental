% This file was generated by the "yardl" tool. DO NOT EDIT.

classdef EncodingTypeSerializer < yardl.binary.RecordSerializer
  methods
    function self = EncodingTypeSerializer()
      field_serializers{1} = mrd.binary.EncodingSpaceTypeSerializer();
      field_serializers{2} = mrd.binary.EncodingSpaceTypeSerializer();
      field_serializers{3} = mrd.binary.EncodingLimitsTypeSerializer();
      field_serializers{4} = yardl.binary.EnumSerializer('mrd.Trajectory', @mrd.Trajectory, yardl.binary.Int32Serializer);
      field_serializers{5} = yardl.binary.OptionalSerializer(mrd.binary.TrajectoryDescriptionTypeSerializer());
      field_serializers{6} = yardl.binary.OptionalSerializer(mrd.binary.ParallelImagingTypeSerializer());
      field_serializers{7} = yardl.binary.OptionalSerializer(yardl.binary.Int64Serializer);
      self@yardl.binary.RecordSerializer('mrd.EncodingType', field_serializers);
    end

    function write(self, outstream, value)
      arguments
        self
        outstream (1,1) yardl.binary.CodedOutputStream
        value (1,1) mrd.EncodingType
      end
      self.write_(outstream, value.encoded_space, value.recon_space, value.encoding_limits, value.trajectory, value.trajectory_description, value.parallel_imaging, value.echo_train_length);
    end

    function value = read(self, instream)
      fields = self.read_(instream);
      value = mrd.EncodingType(encoded_space=fields{1}, recon_space=fields{2}, encoding_limits=fields{3}, trajectory=fields{4}, trajectory_description=fields{5}, parallel_imaging=fields{6}, echo_train_length=fields{7});
    end
  end
end
