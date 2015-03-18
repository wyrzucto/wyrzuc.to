module Service
  class AdminController < Service::ApplicationController

    def edit; end

    def update
      if current_admin.update_attributes(admin_params)
        redirect_to service_root_path, notice: 'Dane zostały zapisane'
      else
        flash[:error] = "Błąd zapisu, spróbuj ponownie..."
        render :edit
      end
    end

    private

    def admin_params
      params.require(:admin).permit(:name, :surname, :avatar, :remove_avatar)
    end
  end
end
