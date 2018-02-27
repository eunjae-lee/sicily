# frozen_string_literal: true

require 'listen'
require 'concurrent'
require 'sicily/batch_processor'
require 'sicily/error/monitor_error'

module Sicily
  class Monitor
    def on(path, &user_rule_block)
      Sicily.logger.info "Starting a monitor on #{path}"
      path = validate_and_expand_path(path)
      start_listener(path) do |files|
        BatchProcessor.new(files).run(&user_rule_block)
      end
    end

    def validate_and_expand_path(path)
      path = File.expand_path(path)
      raise MonitorError.new("Monitor Failed. Unknown path : #{path}") unless File.exist?(path)
      path
    end

    private

    def start_listener(path)
      delay = Sicily.config.delay_on_file_monitoring
      listener = Listen.to(path, wait_for_delay: delay) do |_modified, added, _removed|
        yield added
      end
      listener.start
    end
  end
end
