# This module is used to encapsulate all methods that are used to log activities
module LogActivity
  module_function

  def save(data, user = nil)
    Log.create(
      info: info(data),
      user: user.presence || 'Admin'
    )
  end

  def info(data)
    if data.is_a?(String)
      data
    else
      "- '#{data.street}': #{data.errors.full_messages.join('. ')}"
    end
  end
end
