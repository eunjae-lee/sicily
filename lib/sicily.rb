require "sicily/version"
require "sicily/config"
require "sicily/monitor"
require "pathname"

module Sicily
  @monitored_paths = []

  def self.on(path, &block)
    if self.can_monitor?(@monitored_paths, path)
      self.start_monitor(path, &block)
    else
      puts "cannot monitor : #{path}"
    end
  end

  def self.start_monitor(path, &block)
    @monitored_paths << File.expand_path(path)
    Monitor.new.on(path, &block)
  end

  def self.can_monitor?(prev_paths, new_path)
    expanded_new_path = File.expand_path(new_path)
    prev_paths.each do |prev_path|
      is_sub_folder = Pathname.new(prev_path).fnmatch?(File.join(expanded_new_path, "**")) ||
          Pathname.new(expanded_new_path).fnmatch?(File.join(prev_path, "**"))
      return false if is_sub_folder
    end

    return true
  end
end
