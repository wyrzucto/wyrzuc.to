module Service
  class PackagingWastesController < Service::ApplicationController

    def new; end

    def create
      ImportData::PackagingWastes.new(file.path, file.original_filename, {}).import
      # ImportDataWorker.perform_async(file.path, file.original_filename, :packaging_wastes)
      redirect_to new_service_packaging_waste_path, notice: t('messages.data_in_progress')
    end

    private

    def file
      params.permit(:file)[:file]
    end
  end
end
