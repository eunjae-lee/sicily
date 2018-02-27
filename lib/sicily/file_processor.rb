# frozen_string_literal: true

module Sicily
  class FileProcessor
    def initialize(path)
      @path = path
      @tag = File.basename(path)
      info 'Start processing...'
    end

    def info(message)
      Sicily.logger.info "#{@tag}\t=>\t#{message}"
    end
  end
end
