require "listen"
require "sicily/config"

module Sicily
  class Monitor
    def on(path, &block)
      # listener = Listen.to(path) do |modified, added, removed|
      #   added.each do |file|
      #     ThreadPool.instance.post do
      #       puts "Begin : #{file}"
      #       MonitorProxy.new(file).instance_eval(&block)
      #       if Preference.instance.notify_when_done?
      #         #NotifyUtil.instance.notify(File.basename(file))
      #       end
      #       puts "End   : #{file}"
      #     end
      #   end
      # end
      # listener.start # not blocking
    end

    def num_thread_pool
      Sicily.config.num_thread_pool
    end
  end
end