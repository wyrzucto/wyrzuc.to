class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_action :load_settings

  private

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end

  def load_settings
    Setting.load!
  end

end
