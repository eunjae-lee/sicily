require "sicily/util/exif_util"
require "pathname"

module Sicily
  module Util
    class FileUtil
      def self.is_related?(maybe_parent_path, maybe_child_path)
        expanded_parent_path = File.expand_path(maybe_parent_path)
        expanded_child_path = File.expand_path(maybe_child_path)
        Pathname.new(expanded_child_path).fnmatch? File.join(expanded_parent_path, "**")
      end

      def self.eval_dest_path(src_path, dest_path)
        time = self.extract_time(src_path)
        time.strftime(dest_path)
      end

      def self.extract_time(path)
        if [".jpg", ".jpeg"].include? File.extname(path).downcase
          time_from_exif = ExifUtil.extract_time_from_jpeg(path)
          return time_from_exif unless time_from_exif.nil?
        end

        File.ctime(path)
      end
    end
  end
end