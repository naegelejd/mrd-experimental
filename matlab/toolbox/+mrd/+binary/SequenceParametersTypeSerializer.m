% This file was generated by the "yardl" tool. DO NOT EDIT.

classdef SequenceParametersTypeSerializer < yardl.binary.RecordSerializer
  methods
    function self = SequenceParametersTypeSerializer()
      field_serializers{1} = yardl.binary.VectorSerializer(yardl.binary.Float32Serializer);
      field_serializers{2} = yardl.binary.VectorSerializer(yardl.binary.Float32Serializer);
      field_serializers{3} = yardl.binary.VectorSerializer(yardl.binary.Float32Serializer);
      field_serializers{4} = yardl.binary.VectorSerializer(yardl.binary.Float32Serializer);
      field_serializers{5} = yardl.binary.OptionalSerializer(yardl.binary.StringSerializer);
      field_serializers{6} = yardl.binary.VectorSerializer(yardl.binary.Float32Serializer);
      field_serializers{7} = yardl.binary.OptionalSerializer(yardl.binary.EnumSerializer('mrd.DiffusionDimension', @mrd.DiffusionDimension, yardl.binary.Int32Serializer));
      field_serializers{8} = yardl.binary.VectorSerializer(mrd.binary.DiffusionTypeSerializer());
      field_serializers{9} = yardl.binary.OptionalSerializer(yardl.binary.StringSerializer);
      self@yardl.binary.RecordSerializer('mrd.SequenceParametersType', field_serializers);
    end

    function write(self, outstream, value)
      arguments
        self
        outstream (1,1) yardl.binary.CodedOutputStream
        value (1,1) mrd.SequenceParametersType
      end
      self.write_(outstream, value.t_r, value.t_e, value.t_i, value.flip_angle_deg, value.sequence_type, value.echo_spacing, value.diffusion_dimension, value.diffusion, value.diffusion_scheme);
    end

    function value = read(self, instream)
      fields = self.read_(instream);
      value = mrd.SequenceParametersType(t_r=fields{1}, t_e=fields{2}, t_i=fields{3}, flip_angle_deg=fields{4}, sequence_type=fields{5}, echo_spacing=fields{6}, diffusion_dimension=fields{7}, diffusion=fields{8}, diffusion_scheme=fields{9});
    end
  end
end
