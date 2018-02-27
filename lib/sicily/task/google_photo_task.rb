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
    class Base
      def self.google_photo(path)
        validate_credentials!
        cmd = build_command(path)
        execute_command(cmd)
      end

      def self.execute_command(cmd)
        `#{cmd}`
      end

      def self.build_command(path)
        "upload-gphotos \"#{path}\" -u #{id} -p #{pw}"
      end

      def self.pw
        Sicily.config_google.pw
      end

      def self.id
        Sicily.config_google.id
      end

      def self.validate_credentials!
        raise 'no google credential' if id.to_s.empty? || pw.to_s.empty?
      end
    end

    module GooglePhotoTask
      def google_photo
        info 'google_photo'
        Base.google_photo(@path)
      end
    end
  end
end
