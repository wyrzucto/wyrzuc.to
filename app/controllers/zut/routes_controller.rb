module Zut
  class RoutesController < ApplicationController
    def index
      @routes = Route.all.page(params[:page])
    end

    def show
      @route = Route.find(params[:id])

      @route_containers = @route.containers
    end

    def new
      @route = Route.new
    end

    def create
      @route = Route.new(route_params)
      if @route.save
        redirect_to zut_routes_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :new
      end
    end

    def destroy
      @route = Route.find(params[:id])
      if @route.destroy
        redirect_to zut_routes_path, notice: t('messages.data_saved')
      else
        redirect_to zut_routes_path, notice: t('messages.data_not_saved')
      end
    end

    def export
      @route = Route.find(params[:id])

      spreadsheet_str = StringIO.new 
      @route.export_sheet.write(spreadsheet_str)
      send_data spreadsheet_str.string, :filename => "#{@route.name}-#{Date.today}.xls", :type =>  "application/vnd.ms-excel"
    end

    private

    def route_params
      params.require(:route).permit(:name)
    end
  end
end
