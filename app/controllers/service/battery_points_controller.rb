module Service
  # This class provides actions for handling battery points logic
  class BatteryPointsController < Service::ApplicationController
    def new; end

    def create
      ImportDataWorker.perform_async(
        :battery_points,
        tempfile_path,
        filename: file.original_filename
      )
      redirect_to service_logs_path, notice: t('messages.data_in_progress')
    end
  end
end
