class ImportDataWorker
  include Sidekiq::Worker

  def perform(kind, file_path, params={})
    LogActivity.save("<span class='import start'>Importowanie rozpoczęte ... (#{kind}, #{params["filename"]})</span>")
    "ImportData::#{kind.to_s.camelcase}".constantize.new(file_path, params).import
    LogActivity.save("<span class='import end'>Importowanie zakończone. (#{kind}, #{params["filename"]})</span>")
  end
end
