class ImportDataWorker
  include Sidekiq::Worker

  def perform(kind, file_path, params={})
    "ImportData::#{kind.to_s.camelcase}".constantize.new(file_path, params).import
  end
end
