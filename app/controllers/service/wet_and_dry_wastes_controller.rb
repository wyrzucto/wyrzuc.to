module Service
  class WetAndDryWastesController < Service::ApplicationController

    def new; end

    def create
      ImportData::WetAndDryWastes.new(file.path, file.original_filename, extra_params).import
      # ImportDataWorker.perform_async(file.path, file.original_filename, :wet_and_dry_wastes, extra_params)
      redirect_to new_service_wet_and_dry_waste_path, notice: t('messages.data_in_progress')
    end

    private

    def file
      params.permit(:file)[:file]
    end

    def extra_params
      params.permit(:area)
    end
  end
end
