# frozen_string_literal: true

require 'sicily/util/exif_util'
require 'pathname'

module Sicily
  module Util
    class FileUtil
      def self.related?(maybe_parent_path, maybe_child_path)
        expanded_parent_path = File.expand_path(maybe_parent_path)
        expanded_child_path = File.expand_path(maybe_child_path)
        parent_path_expr = File.join(expanded_parent_path, '**')
        Pathname.new(expanded_child_path).fnmatch? parent_path_expr
      end

      def self.eval_dest_path(src_path, dest_path)
        time = extract_time(src_path)
        time.strftime(dest_path)
      end

      def self.extract_time(path)
        if %w[.jpg .jpeg].include? File.extname(path).downcase
          time_from_exif = ExifUtil.extract_time_from_jpeg(path)
          return time_from_exif unless time_from_exif.nil?
        end

        File.ctime(path)
      end
    end
  end
end
