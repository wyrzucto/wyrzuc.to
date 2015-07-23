module Service
  class LogsController < Service::ApplicationController

    def index
      @logs = Log.order(created_at: :desc)
    end
  end
end
