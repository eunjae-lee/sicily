require "listen"
require "concurrent"
require "sicily/batch_processor"

module Sicily
  class Monitor
    def on(path, &block)
      path = validate_path!(path)
      listener = Listen.to(path) do |modified, added, removed|
        BatchProcessor.new(added).run(&block)
      end
      listener.start
    end

    def validate_path!(path)
      path = File.expand_path(path)
      raise "Unknown path : #{path}" unless File.exists?(path)
      path
    end
  end
end