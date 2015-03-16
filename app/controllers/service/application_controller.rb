module Service
  class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    layout 'service'

    before_action :authenticate_admin!
  end
end
