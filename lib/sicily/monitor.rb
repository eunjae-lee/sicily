# frozen_string_literal: true

require 'listen'
require 'concurrent'
require 'sicily/batch_processor'

module Sicily
  class Monitor
    def on(path, &user_rule_block)
      path = validate_path!(path)
      start_listener(path) do |files|
        BatchProcessor.new(files).run(&user_rule_block)
      end
    end

    def validate_path!(path)
      path = File.expand_path(path)
      raise "Unknown path : #{path}" unless File.exist?(path)
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
