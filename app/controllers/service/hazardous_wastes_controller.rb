module Service
  class HazardousWastesController < Service::ApplicationController

    def new; end

    def create
      ImportData::HazardousWastes.new(file.path, file.original_filename, {}).import
      # ImportDataWorker.perform_async(file.path, file.original_filename, :hazardous_wastes)
      redirect_to new_service_hazardous_waste_path, notice: t('messages.data_in_progress')
    end

    private

    def file
      params.permit(:file)[:file]
    end
  end
end
