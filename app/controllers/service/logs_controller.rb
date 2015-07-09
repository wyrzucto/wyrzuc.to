module Service
  class LogsController < Service::ApplicationController

    def index
      @logs = Log.all
    end
  end
end
