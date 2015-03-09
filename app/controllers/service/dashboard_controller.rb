module Service
  class DashboardController < ApplicationController
    before_action :authenticate_admin!

    def show; end
  end
end
