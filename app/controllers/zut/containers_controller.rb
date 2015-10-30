module Zut
  class ContainersController < ApplicationController
    def index
      @containers = Wastes::PackagingWaste.all.page(params[:page])

      @districts = District.order(:name)
      @routes = Route.order(:id)
      @container_types = {
        clear_glass: 'Szkło bezbarwne',
        colorful_glass: 'Szkło kolorowe',
        plastic: 'Tworzywa sztuczne',
        maculature: 'Makulatura',
      }

      if params[:s].present?
        @containers = @containers.where('LOWER(street) LIKE ?', "%#{params[:s].downcase}%")
      end

      if params[:district]
        @selected_districts = District.where(id: params[:district])
        @containers = @containers.where(district: @district)
      end

      if params[:route]
        @selected_routes = Route.where(id: params[:route])
        @containers = @containers.where(route: @route)
      end

      if params[:area]
        @containers = @containers.where(area: params[:area])
      end

      if params[:format_type] == 'Eksportuj'
        @csv = CSV.generate do |csv|
          csv << [
            'Numer',
            'Adres',
            'Dzielnica',
            'Sektor',
            'Szkło bezbarwne',
            'Szkło kolorowe',
            'Tworzywa sztuczne',
            'Makulatura',
            'Uwagi',
          ]
          inx = 0
          @containers.each do |container|
            csv << [
              inx += 1,
              container.street,
              container.district,
              container.area,
              container.clear_glass_containers,
              container.colorful_glass_containers,
              container.plastic_containers,
              container.maculature_containers,
              container.details
            ]
          end
        end
        render json: @csv
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
      params.require(:wastes_packaging_waste).permit(:street_number, :street_name, :clear_glass_containers, :colorful_glass_containers, :maculature_containers, :plastic_containers, :latitude, :longitude, :district_id, :area, :details, :visible)
    end
  end
end
