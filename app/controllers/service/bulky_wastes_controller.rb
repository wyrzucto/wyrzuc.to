module Service
  class BulkyWastesController < Service::ApplicationController

    def new; end

    def create
       ImportDataWorker.perform_async(:bulky_wastes, tempfile_path, extra_params)
      redirect_to new_service_bulky_waste_path, notice: t('messages.data_in_progress')
    end

    private

    def extra_params
      params.permit(:area)
    end
  end
end
