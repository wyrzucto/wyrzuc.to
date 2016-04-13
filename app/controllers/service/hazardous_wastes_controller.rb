module Service
  # This class provides actions for handling hazardous wastes logic
  class HazardousWastesController < Service::ApplicationController
    def new
    end

    def create
      ImportDataWorker.perform_async(
        :hazardous_wastes,
        tempfile_path,
        filename: file.original_filename
      )
      redirect_to service_logs_path, notice: t('messages.data_in_progress')
    end
  end
end
