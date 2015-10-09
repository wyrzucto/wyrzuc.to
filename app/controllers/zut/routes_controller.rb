module Zut
  class RoutesController < ApplicationController
    def index
      @routes = Route.all.page(params[:page])
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

    def edit
      @route = Route.find(params[:id])
    end

    def update
      @route = Route.find(params[:id])
      if @route.update_attributes(route_params)
        redirect_to zut_routes_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :edit
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

    private

    def route_params
      params.require(:route).permit(:name)
    end
  end
end
