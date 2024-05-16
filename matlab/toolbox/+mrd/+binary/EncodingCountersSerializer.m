% This file was generated by the "yardl" tool. DO NOT EDIT.

classdef EncodingCountersSerializer < yardl.binary.RecordSerializer
  methods
    function self = EncodingCountersSerializer()
      field_serializers{1} = yardl.binary.OptionalSerializer(yardl.binary.Uint32Serializer);
      field_serializers{2} = yardl.binary.OptionalSerializer(yardl.binary.Uint32Serializer);
      field_serializers{3} = yardl.binary.OptionalSerializer(yardl.binary.Uint32Serializer);
      field_serializers{4} = yardl.binary.OptionalSerializer(yardl.binary.Uint32Serializer);
      field_serializers{5} = yardl.binary.OptionalSerializer(yardl.binary.Uint32Serializer);
      field_serializers{6} = yardl.binary.OptionalSerializer(yardl.binary.Uint32Serializer);
      field_serializers{7} = yardl.binary.OptionalSerializer(yardl.binary.Uint32Serializer);
      field_serializers{8} = yardl.binary.OptionalSerializer(yardl.binary.Uint32Serializer);
      field_serializers{9} = yardl.binary.OptionalSerializer(yardl.binary.Uint32Serializer);
      field_serializers{10} = yardl.binary.VectorSerializer(yardl.binary.Uint32Serializer);
      self@yardl.binary.RecordSerializer('mrd.EncodingCounters', field_serializers);
    end

    function write(self, outstream, value)
      arguments
        self
        outstream (1,1) yardl.binary.CodedOutputStream
        value (1,1) mrd.EncodingCounters
      end
      self.write_(outstream, value.kspace_encode_step_1, value.kspace_encode_step_2, value.average, value.slice, value.contrast, value.phase, value.repetition, value.set, value.segment, value.user);
    end

    function value = read(self, instream)
      fields = self.read_(instream);
      value = mrd.EncodingCounters(kspace_encode_step_1=fields{1}, kspace_encode_step_2=fields{2}, average=fields{3}, slice=fields{4}, contrast=fields{5}, phase=fields{6}, repetition=fields{7}, set=fields{8}, segment=fields{9}, user=fields{10});
    end
  end
end
