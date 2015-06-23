module Service
  class PackagingWastesController < Service::ApplicationController

    def new; end

    def create
      ImportDataWorker.perform_async(:packaging_wastes, tempfile_path)
      redirect_to new_service_packaging_waste_path, notice: t('messages.data_in_progress')
    end
  end
end
