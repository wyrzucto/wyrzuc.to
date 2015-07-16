module ImportData
  class InvalidFileExtension < StandardError; end
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
      date.gsub('.', '-')
    end

    def excel
      @file_extension ||= case file_extension
      when '.xls'  then Roo::Excel.new(file_path, nil, :ignore)
      when '.xlsx' then Roo::Excelx.new(file_path, nil, :ignore)
      else raise ImportData::InvalidFileExtension
      end
    end

    def json
      @file_extension ||= case file_extension
      when '.json', '.geojson'  then JSON::load(File.open(file_path, 'r') {|f| f.read }).with_indifferent_access
      else raise ImportData::InvalidFileExtension
      end
    end

    def file_extension
      File.extname(file_path)
    end
  end
end
