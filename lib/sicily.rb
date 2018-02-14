require "sicily/version"
require "sicily/config"
require "sicily/monitor"
require "sicily/util/file_util"

module Sicily
  @monitored_paths = []

  def self.on(path, &block)
    if self.can_monitor?(@monitored_paths, path)
      self.start_monitor!(path, &block)
    else
      puts "cannot monitor : #{path}"
    end
  end

  def self.start_monitor!(path, &block)
    @monitored_paths << File.expand_path(path)
    Monitor.new.on(path, &block)
  end

  def self.can_monitor?(prev_paths, new_path)
    prev_paths.each do |prev_path|
      return false if FileUtil.is_related?(prev_path, new_path) ||
          FileUtil.is_related?(new_path, prev_path)
    end

    true
  end
end
