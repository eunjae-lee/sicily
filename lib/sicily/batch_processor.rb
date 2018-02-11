require "sicily/config"
require "sicily/file_processor"

module Sicily
  class BatchProcessor
    def run(files, &block)
      pool = Concurrent::FixedThreadPool.new(Sicily.config.num_thread_pool)
      files.each do |file|
        pool.post do
          process_added_file(file, &block)
        end
      end
      # FIXME : Do I need something like `pool.join` here?

      notify(files) if Sicily.config.notify_when_done
    end

    def process_added_file(file, &block)
      FileProcessor.new(file).instance_eval(&block)
    end

    def notify(files)

    end
  end
end