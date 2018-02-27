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

    def run(&user_rule_block)
      return if @files.empty?

      notify_beginning
      process_files_in_thread(&user_rule_block)
      notify_done_when_finished
    end

    def notify_beginning
      Util::NotificationUtil.notify_beginning(@files)
    end

    def process_files_in_thread(&user_rule_block)
      @files.each do |file|
        process_each_file_in_thread file, &user_rule_block
      end
    end

    def process_each_file_in_thread(file, &user_rule_block)
      @pool.post do
        process_added_file(file, &user_rule_block)
        @latch.count_down
      end
    end

    def notify_done_when_finished
      @pool.post do
        @latch.wait
        notify_done
      end
    end

    def process_added_file(file, &user_rule_block)
      file_processor = FileProcessor.new(file)
      file_processor.instance_eval(&user_rule_block)
      file_processor.info 'Done'
    rescue RuntimeError => e
      Sicily.logger.error e.message
    end

    def notify_done
      Util::NotificationUtil.notify_done(@files)
    end
  end
end
