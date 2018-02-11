require "listen"
require "concurrent"
require "sicily/batch_processor"

module Sicily
  class Monitor
    def on(path, &block)
      listener = Listen.to(path) do |modified, added, removed|
        BatchProcessor.new.run(added, &block)
      end
      listener.start
    end

    def process_added_files(files, &block)
      pool = Concurrent::FixedThreadPool.new(@num_thread_pool)
      files.each do |file|
        pool.post do
          process_added_file(file, &block)
        end
      end
      if @notify_when_done
        notify(files)
      end
    end

    def process_added_file(file, &block)
      FileProcessor.new(file).instance_eval(&block)
    end

    def notify(files)

    end
  end
end