module Service
  class HazardousWastesController < Service::ApplicationController

    def new; end

    def create
      ImportDataWorker.perform_async(params.permit(:file), :hazardous_wastes)
      redirect_to new_service_hazardous_waste_path, notice: "Dane są w trakcie przetwarzania..."
    end
  end
end
