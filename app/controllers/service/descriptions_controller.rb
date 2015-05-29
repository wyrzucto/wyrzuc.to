module Service
  class DescriptionsController < Service::ApplicationController

    def index
      @descriptions = Description.all
    end

    def new
      @description = Description.new
    end

    def create
      @description = Description.new(description_params)
      if @description.save
        redirect_to service_descriptions_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :new
      end
    end

    def edit
      @description = Description.find(params[:id])
    end

    def update
      @description = Description.find(params[:id])
      if @description.update_attributes(description_params)
        redirect_to service_descriptions_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :edit
      end
    end

    def destroy
      @description = Description.find(params[:id])
      if @description.destroy
        redirect_to service_descriptions_path, notice: t('messages.data_saved')
      else
        redirect_to service_descriptions_path, notice: t('messages.data_not_saved')
      end
    end

    private

    def description_params
      params.require(:description).permit(:description)
    end
  end
end
