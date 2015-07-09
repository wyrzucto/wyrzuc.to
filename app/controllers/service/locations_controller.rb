module Service
  class LocationsController < Service::ApplicationController

    def new; end

    def create
      ImportDataWorker.perform_async(:locations, tempfile_path)
      redirect_to new_service_location_path, notice: t('messages.data_in_progress')
    end
  end
end
