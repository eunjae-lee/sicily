# frozen_string_literal: true

require 'terminal-notifier'

module Sicily
  module Util
    class NotificationUtil
      def self.notify_beginning(files)
        msg = file_names(files)
        title = "Beginning processing #{files.size} file(s)"
        TerminalNotifier.notify(msg, title: title)
      end

      def self.notify_done(files)
        msg = file_names(files)
        title = "Finished processing #{files.size} file(s)"
        TerminalNotifier.notify(msg, title: title)
      end

      def self.file_names(files)
        files.map do |file|
          File.basename(file)
        end.join(', ')
      end
    end
  end
end
