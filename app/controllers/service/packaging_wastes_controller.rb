module Service
  class PackagingWastesController < Service::ApplicationController

    def new; end

    def create
      ImportDataWorker.perform_async(params.permit(:file), :packaging_wastes)
      redirect_to new_service_packaging_waste_path, notice: "Dane są w trakcie przetwarzania..."
    end
  end
end
