module Service
  module ApplicationHelper

    def avatar_path(user = nil)
      user ||= current_admin
      user.avatar? ? user.avatar_url : 'avatar.png'
    end
  end
end
