# frozen_string_literal: true

require 'sicily/version'
require 'sicily/config'
require 'sicily/monitor'
require 'sicily/util/file_util'
require 'sicily/task_loader'

module Sicily
  @monitored_paths = []

  TaskLoader.new.load_all_tasks

  def self.on(path, &block)
    if can_monitor?(@monitored_paths, path)
      start_monitor!(path, &block)
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
      parent_child_relationship = Util::FileUtil.related?(prev_path, new_path)
      child_parent_relationship = Util::FileUtil.related?(new_path, prev_path)
      return false if parent_child_relationship || child_parent_relationship
    end

    true
  end
end
