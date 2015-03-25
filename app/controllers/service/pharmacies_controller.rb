module Service
  class PharmaciesController < Service::ApplicationController

    def new; end

    def create
      ImportData::Pharmacies.new(file.path, file.original_filename, {}).import
      # ImportDataWorker.perform_async(file.path, file.original_filename, :pharmacies)
      redirect_to new_service_pharmacy_path, notice: t('messages.data_in_progress')
    end

    private

    def file
      params.permit(:file)[:file]
    end
  end
end
