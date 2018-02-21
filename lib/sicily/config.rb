module Sicily
  class << self
    attr_accessor :config, :config_google
  end

  def self.configure_google(&block)
    # FIXME : This should go to somewhere in `google_photo_task.rb`
    return if block.nil?
    block.call Sicily.config_google
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

  class GoogleCredential
    attr_accessor :id, :pw
  end
end

Sicily.config = Sicily::Config.new
Sicily.config_google = Sicily::GoogleCredential.new