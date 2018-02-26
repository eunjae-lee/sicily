require "terminal-notifier"

module Sicily
  module Util
    class NotificationUtil
      def self.notify_beginning(files)
        msg = file_names(files)
        TerminalNotifier.notify(msg, :title => "Beginning processing #{files.size} file(s)")
      end

      def self.notify_done(files)
        msg = file_names(files)
        TerminalNotifier.notify(msg, :title => "Finished processing #{files.size} file(s)")
      end

      def self.file_names(files)
        msg = files.map {|file|
          File.basename(file)
        }.join(", ")
      end
    end
  end
end