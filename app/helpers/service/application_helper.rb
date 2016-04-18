module Service
  # This module is used to encapsulate all helper methods
  module ApplicationHelper
    def avatar_path
      current_admin.avatar? ? current_admin.avatar_url : 'avatar.png'
    end
  end
end
