# frozen_string_literal: true

require 'logger'

module Sicily
  class << self
    attr_accessor :logger
  end

  class LoggerWrapper
    def initialize
      create_logger
    end

    def unknown(*args)
      @logger.unknown(*args)
    end

    def fatal(*args)
      @logger.fatal(*args)
    end

    def error(*args)
      @logger.error(*args)
    end

    def warn(*args)
      @logger.warn(*args)
    end

    def info(*args)
      @logger.info(*args)
    end

    def debug(*args)
      @logger.debug(*args)
    end

    private

    def create_logger
      @logger = if $SICILY_LOG_TO_FILE
                  Logger.new File.join(Dir.pwd, './monitor.log')
                else
                  Logger.new STDOUT
                end
    end
  end

  Sicily.logger = LoggerWrapper.new
end
