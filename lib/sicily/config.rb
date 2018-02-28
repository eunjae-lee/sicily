# frozen_string_literal: true

module Sicily
  class << self
    attr_accessor :config
  end

  class Config
    attr_accessor :forbid_new_file_in_subfolder,
                  :num_thread_pool,
                  :delay_on_file_monitoring,
                  :consume_on_start

    def initialize
      @forbid_new_file_in_subfolder = true
      @num_thread_pool = 10
      @delay_on_file_monitoring = 10
      @consume_on_start = true
    end
  end

  Sicily.config = Config.new

  def self.configure(&block)
    block.call Sicily.config if block_given?
  end

  def self.load_all_configs
    return unless $SICILY_LOAD_USER_CONFIGS

    Sicily.logger.debug "#{Sicily.generators.size} generators found."
    Sicily.generators.each do |generator|
      path = File.expand_path "#{File.dirname(__FILE__)}/../../config/#{generator.filename}"
      next unless generator.load_on_start
      Sicily.logger.debug "ConfigLoader : #{path}"
      load path
    end
  end
end
