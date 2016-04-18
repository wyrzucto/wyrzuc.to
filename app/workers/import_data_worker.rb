# Worker used to import data in a background process.
# This can take up to 1-2 minutes, that's why we are not doing this in a request
class ImportDataWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  # rubocop:disable Metrics/MethodLength
  def perform(kind, file_path, params = {})
    filename = params['filename']

    LogActivity.save(
      "<span class='import start'>Importowanie rozpoczęte ... (#{kind}, #{filename})</span>"
    )

    begin
      "ImportData::#{kind.to_s.camelcase}".constantize.new(file_path, params).import
      LogActivity.save(
        "<span class='import end'>Importowanie zakończone. (#{kind}, #{filename})</span>"
      )

    rescue StandardError => e
      LogActivity.save(e.message)
      LogActivity.save(
        "<span class='import end error'>Importowanie zakończone. (#{kind}, #{filename})</span>"
      )
      raise e
    end
  end
  # rubocop:enable Metrics/MethodLength
end
