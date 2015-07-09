module Service
  class FractionsController < Service::ApplicationController

    def index
      @fractions = Fraction.all
    end

    def new
      @fraction = Fraction.new
    end

    def create
      @fraction = Fraction.new(fracrion_params)
      if @fraction.save
        redirect_to service_fractions_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :new
      end
    end

    def edit
      @fraction = Fraction.find(params[:id])
    end

    def update
      @fraction = Fraction.find(params[:id])
      if @fraction.update_attributes(fracrion_params)
        redirect_to service_fractions_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :edit
      end
    end

    def destroy
      @fraction = Fraction.find(params[:id])
      if @fraction.destroy
        redirect_to service_fractions_path, notice: t('messages.data_saved')
      else
        redirect_to service_fractions_path, notice: t('messages.data_not_saved')
      end
    end

    private

    def fracrion_params
      params.require(:fraction).permit(:name, :description, :waste_data_id)
    end
  end
end
