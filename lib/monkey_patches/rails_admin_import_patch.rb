module RailsAdminImport
  module Formats
    class CSVImporter < FileImporter
      def each_record
        CSV.foreach(filename, **csv_options) do |row|
          attr = convert_to_attributes(row)
          yield attr unless attr.all? { |field, value| value.blank? }
        end
      end
    end
  end
end

