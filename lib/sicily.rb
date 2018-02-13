require "sicily/version"
require "sicily/config"
require "sicily/monitor"

module Sicily
  def self.on(path, &block)
    Monitor.new.on(path, &block)
  end
end
