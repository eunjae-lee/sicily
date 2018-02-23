module Sicily
  class << self
    attr_accessor :config
  end

  class Config
    attr_reader :forbid_new_file_in_subfolder,
                :notify_when_done,
                :num_thread_pool

    def initialize
      @forbid_new_file_in_subfolder = true
      @notify_when_done = true
      @num_thread_pool = 50
    end
  end

  Sicily.config = Config.new
end