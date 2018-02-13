require "terminal-notifier"

module Sicily
  class NotifyUtil
    def self.notify(files)
      msg = files.map { |file|
        File.basename(file)
      }.join(", ")
      TerminalNotifier.notify(msg, :title => "Finished processing #{files.size} files")
    end
  end
end