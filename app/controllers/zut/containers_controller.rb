module Zut
  class ContainersController < ApplicationController
    def index
      @containers = Waste.packaging_wastes.page(params[:page])
    end

    def new
      @container = Waste.packaging_wastes.new
    end

    def create
      @container = Waste.packaging_wastes.new(container_params)
      if @container.save
        redirect_to service_containers_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :new
      end
    end

    def edit
      @container = Waste.packaging_wastes.find(params[:id])
    end

    def update
      @container = Waste.packaging_wastes.find(params[:id])
      if @container.update_attributes(container_params)
        redirect_to service_containers_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :edit
      end
    end

    def destroy
      @container = Waste.packaging_wastes.find(params[:id])
      if @container.destroy
        redirect_to service_containers_path, notice: t('messages.data_saved')
      else
        redirect_to service_containers_path, notice: t('messages.data_not_saved')
      end
    end

    private

    def container_params
      params.require(:waste).permit(:name, :description, :waste_data_id)
    end
  end
end
