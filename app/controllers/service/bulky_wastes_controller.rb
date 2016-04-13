module Service
  # This class provides actions for handling bulky wastes logic
  class BulkyWastesController < Service::ApplicationController
    def new
    end

    def create
      ImportDataWorker.perform_async(
        :bulky_wastes,
        tempfile_path,
        filename: file.original_filename,
        area: params[:area]
      )
      redirect_to service_logs_path, notice: t('messages.data_in_progress')
    end

    private

    def extra_params
      params.permit(:area)
    end
  end
end
