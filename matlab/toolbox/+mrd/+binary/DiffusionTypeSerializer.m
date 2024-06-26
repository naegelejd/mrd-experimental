% This file was generated by the "yardl" tool. DO NOT EDIT.

classdef DiffusionTypeSerializer < yardl.binary.RecordSerializer
  methods
    function self = DiffusionTypeSerializer()
      field_serializers{1} = mrd.binary.GradientDirectionTypeSerializer();
      field_serializers{2} = yardl.binary.Float32Serializer;
      self@yardl.binary.RecordSerializer('mrd.DiffusionType', field_serializers);
    end

    function write(self, outstream, value)
      arguments
        self
        outstream (1,1) yardl.binary.CodedOutputStream
        value (1,1) mrd.DiffusionType
      end
      self.write_(outstream, value.gradient_direction, value.bvalue);
    end

    function value = read(self, instream)
      fields = self.read_(instream);
      value = mrd.DiffusionType(gradient_direction=fields{1}, bvalue=fields{2});
    end
  end
end
