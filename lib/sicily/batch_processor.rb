require "sicily/config"
require "sicily/file_processor"
require "sicily/notify_util"

module Sicily
  class BatchProcessor
    def run(files, &block)
      return if files.empty?

      notify_when_done = Sicily.config.notify_when_done
      pool = Concurrent::FixedThreadPool.new(Sicily.config.num_thread_pool)
      latch = Concurrent::CountDownLatch.new(files.size)
      files.each do |file|
        pool.post do
          begin
            process_added_file(file, &block)
          rescue Exception => e
            # FIXME : need to log `e.message`
          end
          latch.count_down
        end
      end

      pool.post do
        latch.wait
        notify(files) if notify_when_done
      end
    end

    def process_added_file(file, &block)
      FileProcessor.new(file).instance_eval(&block)
    end

    def notify(files)
      NotifyUtil.notify(files)
    end
  end
end