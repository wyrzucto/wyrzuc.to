# This class describe single waste data object
class WasteData < ActiveYaml::Base
  set_root_path Rails.root.join('db/data')
end
