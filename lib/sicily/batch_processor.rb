# frozen_string_literal: true

require 'sicily/config'
require 'sicily/file_processor'
require 'sicily/util/notification_util'

module Sicily
  class BatchProcessor
    def initialize(files)
      @files = files
      @pool = Concurrent::FixedThreadPool.new(Sicily.config.num_thread_pool)
      @latch = Concurrent::CountDownLatch.new(@files.size)
    end

    def run(&block)
      return if @files.empty?

      notify_beginning
      process_each_file_in_thread(block)
      notify_done_when_finished
    end

    def notify_beginning
      Util::NotificationUtil.notify_beginning(@files)
    end

    def process_each_file_in_thread(block)
      @files.each do |file|
        @pool.post do
          process_added_file(file, &block)
          @latch.count_down
        end
      end
    end

    def notify_done_when_finished
      @pool.post do
        @latch.wait
        notify_done
      end
    end

    def process_added_file(file, &block)
      begin
        FileProcessor.new(file).instance_eval(&block)
      rescue Exception => e
        # FIXME : need to log `e.message`
      end
    end

    def notify_done
      Util::NotificationUtil.notify_done(@files)
    end
  end
end
