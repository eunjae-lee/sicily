require "sicily/config"

module Sicily
  module Task
    class GooglePhotoTask
      def self.upload(path)
        id = GoogleCredential.instance.id
        pw = GoogleCredential.instance.pw

        if id.to_s.empty? or pw.to_s.empty?
          raise "no google credential"
        else
          cmd = "upload-gphotos \"#{path}\" -u #{id} -p #{pw}"
          `#{cmd}`
        end
      end
    end
  end
end
