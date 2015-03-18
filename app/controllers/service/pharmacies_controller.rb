module Service
  class PharmaciesController < Service::ApplicationController

    def new; end

    def create
      ImportDataWorker.perform_async(params.permit(:file), :pharmacies)
      redirect_to new_service_pharmace_path, notice: "Dane są w trakcie przetwarzania..."
    end
  end
end
