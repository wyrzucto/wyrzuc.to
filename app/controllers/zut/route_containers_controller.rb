module Zut
  class RouteContainersController < ApplicationController
    def new
      @route = Route.find(params[:route_id])
      @route_container = @route.containers.new

      @containers_list = Wastes::PackagingWaste.where.not(id: Wastes::PackagingWaste.where(route: @route)).order(:street)
    end

    def create
      @route = Route.find(params[:route_id])
      @route_container = Wastes::PackagingWaste.find(route_container_param)



      if @route_container.update_attribute(:route_id, @route.id)
        redirect_to zut_route_path(@route), notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :new
      end
    end

    def move
      @route = Route.find(params[:route_id])
      @route_container = @route.containers.find(params[:route_container_id])

      @dst_container = @route.containers.offset(params[:position]).first

      @route_container.insert_at(params[:position].to_i+1)

      respond_to do |format|
        format.json { render json: {status: :success} }
        format.html { redirect_to back_path, notice: t('messages.data_saved') }
      end
    end

    def destroy
      @route = Route.find(params[:route_id])
      @route_container = @route.containers.find(params[:id])

      if @route_container.update_attribute(:route_id, nil)
        redirect_to zut_route_path(@route), notice: t('messages.data_saved')
      else
        redirect_to zut_route_path(@route), notice: t('messages.data_not_saved')
      end
    end

    private

    def route_container_param
      params.require(:wastes_packaging_waste).permit(:id)[:id]
    end
  end
end
