module Service
  # This class provides actions for handling phrases logic
  class PhrasesController < Service::ApplicationController
    def index
      @phrases = Phrase.includes(:fraction).all
    end

    def new
      @phrase = Phrase.new
    end

    def create
      @phrase = Phrase.new(phrase_params)
      if @phrase.save
        redirect_to service_phrases_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :new
      end
    end

    def edit
      @phrase = Phrase.find(params[:id])
    end

    def update
      @phrase = Phrase.find(params[:id])
      if @phrase.update_attributes(phrase_params)
        redirect_to service_phrases_path, notice: t('messages.data_saved')
      else
        flash[:error] = t('messages.data_not_saved')
        render :edit
      end
    end

    def destroy
      @phrase = Phrase.find(params[:id])
      if @phrase.destroy
        redirect_to service_phrases_path, notice: t('messages.data_saved')
      else
        redirect_to service_phrases_path, notice: t('messages.data_not_saved')
      end
    end

    def new_import_data; end

    def import_data
      ImportDataWorker.perform_async(
        :phrases,
        tempfile_path,
        filename: file.original_filename
      )
      redirect_to service_logs_path, notice: t('messages.data_in_progress')
    end

    private

    def phrase_params
      params.require(:phrase).permit(:name, :fraction_id)
    end
  end
end
