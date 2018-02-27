# frozen_string_literal: true

require 'sicily/config'

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
        validate_credentials!
        cmd = build_command
        execute_command(cmd)
      end

      def execute_command(cmd)
        `#{cmd}`
      end

      def build_command
        "upload-gphotos \"#{@path}\" -u #{id} -p #{pw}"
      end

      def pw
        Sicily.config_google.pw
      end

      def id
        Sicily.config_google.id
      end

      def validate_credentials!
        raise 'no google credential' if id.to_s.empty? || pw.to_s.empty?
      end
    end
  end
end
