module Zut
  # This class provides actions for handling zut districts logic
  class DistrictsController < ApplicationController
    def index
      @districts = District.all.page(params[:page])
    end

    def new
      @district = District.new
    end

    def create
      @district = District.new(district_params)
      if @district.save
        redirect_to zut_districts_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :new
      end
    end

    def edit
      @district = District.find(params[:id])
    end

    def update
      @district = District.find(params[:id])
      if @district.update_attributes(district_params)
        redirect_to zut_districts_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :edit
      end
    end

    def destroy
      @district = District.find(params[:id])
      if @district.destroy
        redirect_to zut_districts_path, notice: t('messages.data_saved')
      else
        redirect_to zut_districts_path, notice: t('messages.data_not_saved')
      end
    end

    private

    def district_params
      params.require(:district).permit(:name)
    end
  end
end
