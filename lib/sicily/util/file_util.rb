require "pathname"

module Sicily
  module Util
    class FileUtil
      def self.is_related?(maybe_parent_path, maybe_child_path)
        expanded_parent_path = File.expand_path(maybe_parent_path)
        expanded_child_path = File.expand_path(maybe_child_path)
        Pathname.new(expanded_child_path).fnmatch? File.join(expanded_parent_path, "**")
      end
    end
  end
end