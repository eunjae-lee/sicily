require "sicily/version"
require "sicily/config"
require "sicily/user_config_loader"
require "sicily/monitor"

module Sicily
  load_user_configs

  def self.on(path, &block)
    Monitor.new.on(path, &block)
  end
end
