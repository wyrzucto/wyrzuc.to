class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_action :load_settings

  private

  def layout_by_resource
    if request.headers['HTTP_X_FANCYBOX'].present? || request.xhr?
      false
    else
      devise_controller? ? 'devise' : 'application'
    end
  end

  def load_settings
    Setting.load!
  end

  def back_path(default = '/')
    request.headers["X-XHR-Referer"] || request.referer || default
  end
end
