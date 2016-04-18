module Service
  # This class provides actions for handling settings logic
  class SettingsController < Service::ApplicationController
    def edit
      @edited_settings = Setting.names
    end

    def update
      @edited_settings = Setting.names
      @edited_settings.each do |setting|
        value = params[:setting][setting]
        Setting.update_setting(setting, value)
      end
      Setting.load!
      redirect_to service_settings_path, notice: t('messages.data_saved')
    end
  end
end
