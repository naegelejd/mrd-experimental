// This file was generated by the "yardl" tool. DO NOT EDIT.

#pragma once
#include <array>
#include <complex>
#include <memory>
#include <optional>
#include <variant>
#include <vector>

#include "../yardl/detail/ndjson/reader_writer.h"
#include "../protocols.h"
#include "../types.h"

namespace mrd::ndjson {
// NDJSON writer for the Mrd protocol.
class MrdWriter : public mrd::MrdWriterBase, yardl::ndjson::NDJsonWriter {
  public:
  MrdWriter(std::ostream& stream)
      : yardl::ndjson::NDJsonWriter(stream, schema_) {
  }

  MrdWriter(std::string file_name)
      : yardl::ndjson::NDJsonWriter(file_name, schema_) {
  }

  void Flush() override;

  protected:
  void WriteHeaderImpl(std::optional<mrd::Header> const& value) override;
  void WriteDataImpl(mrd::StreamItem const& value) override;
  void EndDataImpl() override {}
  void CloseImpl() override;
};

// NDJSON reader for the Mrd protocol.
class MrdReader : public mrd::MrdReaderBase, yardl::ndjson::NDJsonReader {
  public:
  MrdReader(std::istream& stream)
      : yardl::ndjson::NDJsonReader(stream, schema_) {
  }

  MrdReader(std::string file_name)
      : yardl::ndjson::NDJsonReader(file_name, schema_) {
  }

  protected:
  void ReadHeaderImpl(std::optional<mrd::Header>& value) override;
  bool ReadDataImpl(mrd::StreamItem& value) override;
  void CloseImpl() override;
};

} // namespace mrd::ndjson
