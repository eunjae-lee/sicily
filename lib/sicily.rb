# frozen_string_literal: true

require 'sicily/version'
require 'sicily/config'
require 'sicily/monitor'
require 'sicily/util/file_util'
require 'sicily/task_loader'

module Sicily
  @monitored_paths = []

  TaskLoader.new.load_all_tasks

  def self.on(path, &user_rule_block)
    if can_monitor?(@monitored_paths, path)
      start_monitor!(path, &user_rule_block)
    else
      puts "cannot monitor : #{path}"
    end
  end

  def self.start_monitor!(path, &user_rule_block)
    @monitored_paths << File.expand_path(path)
    Monitor.new.on(path, &user_rule_block)
  end

  def self.can_monitor?(prev_paths, new_path)
    prev_paths.each do |prev_path|
      return false if somehow_related?(prev_path, new_path)
    end

    true
  end

  def self.somehow_related?(path1, path2)
    parent_child_relationship = Util::FileUtil.related?(path1, path2)
    child_parent_relationship = Util::FileUtil.related?(path2, path1)

    parent_child_relationship || child_parent_relationship
  end
end
