module Zut
  class RouteVersionsController < ApplicationController
    def index
      @route = Route.find(params[:route_id])

      @route_versions = @route.route_versions.order(id: :desc)
    end
  end
end
