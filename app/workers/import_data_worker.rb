class ImportDataWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(kind, file_path, params={})
    LogActivity.save("<span class='import start'>Importowanie rozpoczęte ... (#{kind}, #{params["filename"]})</span>")
    
    begin
      "ImportData::#{kind.to_s.camelcase}".constantize.new(file_path, params).import
      LogActivity.save("<span class='import end'>Importowanie zakończone. (#{kind}, #{params["filename"]})</span>")

    rescue Exception => e  
      LogActivity.save(e.message)
      LogActivity.save("<span class='import end error'>Importowanie zakończone. (#{kind}, #{params["filename"]})</span>")	
      raise e
    end
  end
end
