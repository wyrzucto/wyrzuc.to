module Service
  class PharmaciesController < Service::ApplicationController

    def new; end

    def create
      ImportDataWorker.perform_async(:pharmacies, tempfile_path)
      redirect_to new_service_pharmacy_path, notice: t('messages.data_in_progress')
    end
  end
end
