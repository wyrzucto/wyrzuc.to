module Service
  # This is base for all service controllers
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    before_action :authenticate_admin!

    layout 'service'

    def tempfile_path
      tmp = Tempfile.new(
        ['', File.extname(file.original_filename)],
        Rails.root.join('tmp/upload_files')
      )
      tmp.binmode
      tmp.write(file.read)
      tmp.path
    end

    def file
      params.permit(:file)[:file]
    end
  end
end
