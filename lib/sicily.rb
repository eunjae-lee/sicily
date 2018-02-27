# frozen_string_literal: true

require 'sicily/version'
require 'sicily/logger'
require 'sicily/config'
require 'sicily/monitor'
require 'sicily/util/file_util'
require 'sicily/task_loader'
require 'sicily/error/monitor_error'

module Sicily
  @monitored_paths = []

  TaskLoader.new.load_all_tasks

  def self.on(path, &user_rule_block)
    if can_monitor?(@monitored_paths, path)
      start_monitor!(path, &user_rule_block)
    else
      Sicily.logger.error "Monitor Failed. Path duplicated : #{path}"
    end
  end

  def self.start_monitor!(path, &user_rule_block)
    @monitored_paths << File.expand_path(path)
    begin
      Monitor.new.on(path, &user_rule_block)
    rescue MonitorError => e
      Sicily.logger.error e.message
    end
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
