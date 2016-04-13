module Zut
  # This class provides actions for handling zut containers logic
  class ContainersController < ApplicationController
    # rubocop:disable all
    def index
      @containers = Wastes::PackagingWaste.order(:street).page(params[:page])

      @districts = District.order(:name)
      @routes = Route.order(:id)
      @container_types = {
        clear_glass: 'Szkło bezbarwne',
        colorful_glass: 'Szkło kolorowe',
        plastic: 'Tworzywa sztuczne',
        maculature: 'Makulatura'
      }

      if params[:s].present?
        @containers = @containers.where('LOWER(street) LIKE ?', "%#{params[:s].downcase}%")
      end

      if params[:district]
        @selected_districts = District.where(id: params[:district]).to_a
        @containers = @containers.where(district: @selected_districts)
      end

      if params[:route]
        @selected_routes = Route.where(id: params[:route]).to_a
        @containers = @containers.where(route: @selected_routes)
      end

      @selected_types = (params[:type] || []) & %w( colorful_glass clear_glass plastic maculature )
      if @selected_types.any?
        types = @selected_types.map { |type| "(#{type}_containers > 0)" }
        @containers = @containers.where(types.join(' OR ').to_s)
      end

      if params[:format_type] == 'Eksportuj'
        @csv = CSV.generate(col_sep: ';') do |csv|
          rec = %W( Numer Adres Opis\ uszczegóławiający Dzielnica Rejon )

          if @selected_types.blank? || @selected_types.member?('clear_glass')
            rec << 'Szkło bezbarwne'
          end

          if @selected_types.blank? || @selected_types.member?('colorful_glass')
            rec << 'Szkło kolorowe'
          end
          if @selected_types.blank? || @selected_types.member?('plastic')
            rec << 'Tworzywa sztuczne'
          end
          if @selected_types.blank? || @selected_types.member?('maculature')
            rec << 'Makulatura'
          end

          rec << 'Typ pojemnika'
          rec << 'Uwagi dla kierowców'
          csv << rec

          inx = 0
          @containers.each do |container|
            rec = [
              inx += 1,
              container.street,
              container.description || '-',
              container.district || '-',
              container.route || '-'
            ]
            if @selected_types.blank? || @selected_types.member?('clear_glass')
              rec << container.clear_glass_containers
            end

            if @selected_types.blank? || @selected_types.member?('colorful_glass')
              rec << container.colorful_glass_containers
            end

            if @selected_types.blank? || @selected_types.member?('plastic')
              rec << container.plastic_containers
            end

            if @selected_types.blank? || @selected_types.member?('maculature')
              rec << container.maculature_containers
            end

            rec << (container.container_type || '-')
            rec << (container.details || '-')
            csv << rec
          end
        end

        send_data @csv.encode('WINDOWS-1250'),
          filename: "kontenery-#{Date.current}.csv",
          type: 'text/csv'
      end
    end
    # rubocop:enable all

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

    # rubocop:disable Metrics/MethodLength
    def container_params
      params2 =
        params
        .require(:wastes_packaging_waste)
        .permit(
          :street_number,
          :street_name,
          :clear_glass_containers,
          :colorful_glass_containers,
          :maculature_containers,
          :plastic_containers,
          :latitude,
          :longitude,
          :district_id,
          :route_id,
          :details,
          :visible,
          :description,
          :uploaded_picture,
          :clear_glass_container_type,
          :colorful_glass_container_type,
          :plastic_container_type,
          :maculature_container_type
        )
      params2[:street] = [params2[:street_name], params2[:street_number]].compact.join(' ')
      params2
    end
    # rubocop:enable Metrics/MethodLength
  end
end
