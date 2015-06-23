module Service
  class HazardousWastesController < Service::ApplicationController

    def new; end

    def create
      ImportDataWorker.perform_async(:hazardous_wastes, tempfile_path)
      redirect_to new_service_hazardous_waste_path, notice: t('messages.data_in_progress')
    end
  end
end
