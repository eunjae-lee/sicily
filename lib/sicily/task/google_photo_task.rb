require "sicily/config"

module Sicily
  module Task
    module GooglePhotoTask
      def google_photo
        id = Sicily.config_google.id
        pw = Sicily.config_google.pw

        if id.to_s.empty? or pw.to_s.empty?
          raise "no google credential"
        else
          cmd = "upload-gphotos \"#{@path}\" -u #{id} -p #{pw}"
          `#{cmd}`
        end
      end
    end
  end
end
