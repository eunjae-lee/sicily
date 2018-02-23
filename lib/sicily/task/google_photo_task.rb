require "sicily/config"

module Sicily
  class << self
    attr_accessor :config_google
  end

  class GoogleCredential
    attr_accessor :id, :pw
  end

  Sicily.config_google = GoogleCredential.new

  def self.configure_google(&block)
    return if block.nil?
    block.call Sicily.config_google
  end

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
