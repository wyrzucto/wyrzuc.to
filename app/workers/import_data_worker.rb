class ImportDataWorker
  include Sidekiq::Worker

  def perform(file_path, file_name, kind, params={})
    "ImportData::#{kind.to_s.camelcase}".constantize.new(file_path, file_name, params).import
  end
end
