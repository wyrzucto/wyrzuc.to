module Zut
  class ContainersController < ApplicationController
    def index
      @containers = Wastes::PackagingWaste.all.page(params[:page])
      if params[:s].present?
        @containers = @containers.where('LOWER(street) LIKE ?', "%#{params[:s].downcase}%")
      end
    end

    def new
      @container = Wastes::PackagingWaste.new
    end

    def create
      @container = Wastes::PackagingWaste.new(container_params)
      if @container.save
        redirect_to zut_containers_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :new
      end
    end

    def edit
      @container = Wastes::PackagingWaste.find(params[:id])
    end

    def update
      @container = Wastes::PackagingWaste.find(params[:id])
      if @container.update_attributes(container_params)
        redirect_to zut_containers_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :edit
      end
    end

    def destroy
      @container = Wastes::PackagingWaste.find(params[:id])
      if @container.destroy
        redirect_to zut_containers_path, notice: t('messages.data_saved')
      else
        redirect_to zut_containers_path, notice: t('messages.data_not_saved')
      end
    end

    private

    def container_params
      params.require(:wastes_packaging_waste).permit(:street_number, :street_name, :clear_glass_containers, :colorfull_glass_containers, :maculature_containers, :plastic_containers, :latitude, :longitude, :district_id)
    end
  end
end
