require "sicily/version"
require "sicily/config"
require "sicily/monitor"
require "sicily/util/file_util"
require "sicily/task_loader"

module Sicily
  @monitored_paths = []

  TaskLoader.new.load_all_tasks

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
      return false if Util::FileUtil.is_related?(prev_path, new_path) ||
          Util::FileUtil.is_related?(new_path, prev_path)
    end

    true
  end
end
