module ImportData
  class InvalidFileExtension < StandardError; end
  class Base

    def initialize(file_path, file_name, params)
      @file_path = file_path
      @file_name = file_name
      @params    = params
    end

    private
    attr_reader :file_path, :file_name, :params

    def clean_street(street)
      street.sub(/[\(|\"|\'].*/, '').strip
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

    def file_extension
      File.extname(file_name)
    end
  end
end
