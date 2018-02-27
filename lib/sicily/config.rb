# frozen_string_literal: true

module Sicily
  class << self
    attr_accessor :config
  end

  class Config
    attr_reader :forbid_new_file_in_subfolder,
                :num_thread_pool,
                :delay_on_file_monitoring

    def initialize
      @forbid_new_file_in_subfolder = true
      @num_thread_pool = 50
      @delay_on_file_monitoring = 10
    end
  end

  Sicily.config = Config.new
end
