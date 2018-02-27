# frozen_string_literal: true

require 'listen'
require 'concurrent'
require 'sicily/batch_processor'

module Sicily
  class Monitor
    def on(path, &block)
      path = validate_path!(path)
      listener = Listen.to(path) do |_modified, added, _removed|
        BatchProcessor.new(added).run(&block)
      end
      listener.start
    end

    def validate_path!(path)
      path = File.expand_path(path)
      raise "Unknown path : #{path}" unless File.exist?(path)
      path
    end
  end
end
