module Service
  class AdminController < Service::ApplicationController

    before_action :find_admin

    def edit; end

    def update
      if @admin.update_attributes(admin_params)
        flash[:message] = 'Dane zostały zapisane'
        redirect_to service_root_path
      else
        flash[:error] = "Błąd zapisu, spróbuj ponownie..."
        render :edit
      end
    end

    private

    def find_admin
      @admin = Admin.find(current_admin)
    end

    def admin_params
      params.require(:admin).permit(:name, :surname)
    end
  end
end
