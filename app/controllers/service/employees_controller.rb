module Service
  class EmployeesController < Service::ApplicationController

    def index
      @employees = Employee.all
    end

    def new
      @employee = Employee.new
    end

    def create
      @employee = Employee.new(employee_params)
      if @employee.save
        redirect_to service_employees_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :new
      end
    end

    def edit
      @employee = Employee.find(params[:id])
    end

    def update
      @employee = Employee.find(params[:id])
      if @employee.update_attributes(employee_params)
        redirect_to service_employees_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :edit
      end
    end

    def destroy
      @employee = Employee.find(params[:id])
      if @employee.destroy
        redirect_to service_employees_path, notice: t('messages.data_saved')
      else
        redirect_to service_employees_path, notice: t('messages.data_not_saved')
      end
    end

    private

    def employee_params
      params.require(:employee).permit(:email, :first_name, :last_name, :password)
    end
  end
end
