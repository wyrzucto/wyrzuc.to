module Service
  class WetAndDryWastesController < Service::ApplicationController

    def new; end

    def create
      ImportDataWorker.perform_async(:wet_and_dry_wastes, tempfile_path, {filename: file.original_filename, area: params[:area]})
      redirect_to service_logs_path, notice: t('messages.data_in_progress')
    end

    private

    def extra_params
      params.permit(:area)
    end
  end
end
