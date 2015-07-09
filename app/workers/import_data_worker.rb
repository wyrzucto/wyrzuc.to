class ImportDataWorker
  include Sidekiq::Worker

  def perform(kind, file_path, params={})
    LogActivity.save("Importowanie rozpoczęte ... (#{kind})")
    "ImportData::#{kind.to_s.camelcase}".constantize.new(file_path, params).import
    LogActivity.save("Importowanie zakończone. (#{kind})")
  end
end
