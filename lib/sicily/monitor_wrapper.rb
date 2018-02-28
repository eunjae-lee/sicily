# frozen_string_literal: true

module Sicily
  class MonitorWrapper
    @monitored_paths = []

    def self.on(path, &user_rule_block)
      if can_monitor?(@monitored_paths, path)
        store_path_and_start_monitor(path, &user_rule_block)
      else
        Sicily.logger.error "Monitor Failed. Path duplicated : #{path}"
      end
    end

    def self.store_path_and_start_monitor(path, &user_rule_block)
      store_monitored_path(path)
      start_monitor!(path, &user_rule_block)
    end

    def self.start_monitor!(path, &user_rule_block)
      Monitor.new.on(path, &user_rule_block)
    rescue MonitorError => e
      Sicily.logger.error e.inspect
    end

    def self.store_monitored_path(path)
      @monitored_paths << File.expand_path(path)
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
end
