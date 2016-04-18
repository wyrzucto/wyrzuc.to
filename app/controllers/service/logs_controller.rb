module Service
  # This class provides actions for handling logs logic
  class LogsController < Service::ApplicationController
    def index
      @logs = Log.order(created_at: :desc)
    end
  end
end
