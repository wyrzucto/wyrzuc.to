module Service
  class WetAndDryWastesController < Service::ApplicationController

    def new; end

    def create
      ImportDataWorker.perform_async(:wet_and_dry_wastes, tempfile_path, extra_params)
      redirect_to new_service_wet_and_dry_waste_path, notice: t('messages.data_in_progress')
    end

    private

    def extra_params
      params.permit(:area)
    end
  end
end
