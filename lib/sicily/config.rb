require "singleton"

module Sicily
  def self.configure(&block)
    return if block.nil?
    block.call Config.instance
  end

  def self.configure_google(&block)
    return if block.nil?
    block.call GoogleCredential.instance
  end

  def self.config
    Config.instance
  end

  class Config
    include Singleton
    attr_accessor :forbid_mv_to_children_folder,
                  :notify_when_done,
                  :num_thread_pool,

    def initialize
      @forbid_mv_to_children_folder = true
      @notify_when_done = true
      @num_thread_pool = 50
    end
  end

  class GoogleCredential
    include Singleton
    attr_accessor :id, :pw
  end
end