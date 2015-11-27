module Zut
  class RoutesController < ApplicationController
    def index
      @routes = Route.all.page(params[:page])
    end

    def show
      @route = Route.find(params[:id])

      @route_containers = @route.containers
    end

    def export
      @route = Route.find(params[:id])

      spreadsheet_str = StringIO.new 
      @route.export_sheet.write(spreadsheet_str)
      send_data spreadsheet_str.string, :filename => "#{@route.name}-#{Date.today}.xls", :type =>  "application/vnd.ms-excel"
    end

    private

    def route_params
      params.require(:route).permit(:name, :area_id)
    end
  end
end
