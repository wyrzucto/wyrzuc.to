module Zut
  class RouteContainersController < ApplicationController
    def new
      @route = Route.find(params[:route_id])
      @route_container = @route.containers.new

      @containers_list = Wastes::PackagingWaste.where(area: @route.area_id).where.not(id: Wastes::PackagingWaste.where(route: @route))
    end

    def create
      @route = Route.find(params[:route_id])
      @route_container = @route.containers.new

      render json: params
      return
      @route = Route.new(route_params)
      if @route.save
        redirect_to zut_route_path(@route), notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :new
      end
    end

    def move
      @route = Route.find(params[:route_id])
      @route_container = @route.containers.find(params[:route_container_id])

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

    def route_params
      params.require(:route).permit(:name, :area_id)
    end
  end
end
