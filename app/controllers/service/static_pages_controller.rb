module Service
  class StaticPagesController < Service::ApplicationController

    def index
      @static_pages = StaticPage.all
    end

    def new
      @static_page = StaticPage.new
    end

    def create
      @static_page = StaticPage.new(static_page_params)
      if @static_page.save
        redirect_to service_static_pages_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :new
      end
    end

    def edit
      @static_page = StaticPage.find(params[:id])
    end

    def update
      @static_page = StaticPage.find(params[:id])
      if @static_page.update_attributes(static_page_params)
        redirect_to service_static_pages_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :edit
      end
    end

    def destroy
      @static_page = StaticPage.find(params[:id])
      if @static_page.destroy
        redirect_to service_static_pages_path, notice: t('messages.data_saved')
      else
        redirect_to service_static_pages_path, notice: t('messages.data_not_saved')
      end
    end

    private

    def static_page_params
      params.require(:static_page).permit(:title, :content)
    end
  end
end
