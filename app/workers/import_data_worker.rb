class ImportDataWorker
  include Sidekiq::Worker

  def perform(file, kind, params={})
    "ImportData::#{kind.capitalize}".constantize.new(file, params).import
  end
end
