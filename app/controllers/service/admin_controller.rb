module Service
  # This class provides actions for handling admin view
  class AdminController < Service::ApplicationController
    def edit; end

    def update
      if current_admin.update_attributes(admin_params)
        redirect_to service_root_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :edit
      end
    end

    private

    def admin_params
      params.require(:admin).permit(:name, :surname, :avatar, :remove_avatar)
    end
  end
end
