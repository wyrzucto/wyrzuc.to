module Service
  class BulkyWastesController < Service::ApplicationController

    def new; end

    def create
      ImportDataWorker.perform_async(file, :bulky_wastes, extra_params)
      redirect_to new_service_bulky_waste_path, notice: "Dane są w trakcie przetwarzania..."
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
