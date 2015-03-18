module Service
  class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    before_action :authenticate_admin!

    layout 'service'
  end
end
