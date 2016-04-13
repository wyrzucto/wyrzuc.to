# This module is used to encapsulate all classes that are used to import data
module ImportData
  # Custom error raisnig when file has invalid extension
  class InvalidFileExtension < StandardError; end

  # Provides shared behaviour for import data services
  class Base
    def initialize(file_path, params)
      @file_path = file_path
      @params    = params
    end

    private

    attr_reader :file_path, :params

    def clean_street(street)
      street.to_s.sub(/[\(|\"|\'].*/, '').sub(/ul\.\s+/i, '').strip
    end

    def parse_date(date)
      date.tr('.', '-')
    end

    def excel
      @file_extension ||=
        case file_extension
        when '.xls'  then Roo::Excel.new(file_path, nil, :ignore)
        when '.xlsx' then Roo::Excelx.new(file_path, nil, :ignore)
        when '.ods' then Roo::OpenOffice.new(file_path, nil, :ignore)
        else raise ImportData::InvalidFileExtension
        end
    end

    def json
      @file_extension ||=
        case file_extension
        when '.json', '.geojson'
        then JSON.load(File.open(file_path, 'r', &:read)).with_indifferent_access
        else raise ImportData::InvalidFileExtension
        end
    end

    def file_extension
      File.extname(file_path)
    end
  end
end
