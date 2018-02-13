require "listen"
require "concurrent"
require "sicily/batch_processor"

module Sicily
  class Monitor
    def on(path, &block)
      path = File.expand_path(path)
      raise "Unknown path : #{path}" unless File.exists?(path)
      listener = Listen.to(path) do |modified, added, removed|
        BatchProcessor.new.run(added, &block)
      end
      listener.start
    end
  end
end