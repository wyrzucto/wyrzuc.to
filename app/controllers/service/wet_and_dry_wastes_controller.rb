module Service
  class WetAndDryWastesController < Service::ApplicationController

    def new; end

    def create
      ImportDataWorker.perform_async(file, :wet_and_dry_wastes, extra_params)
      redirect_to new_service_wet_and_dry_waste_path, notice: "Dane są w trakcie przetwarzania..."
    end

    private

    def file
      params.permit(:file)
    end

    def extra_params
      { sector: params.permit(:sector) }
    end
  end
end
