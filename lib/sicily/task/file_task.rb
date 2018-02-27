# frozen_string_literal: true

require 'fileutils'
require 'sicily/config'

module Sicily
  module Task
    class Base
      def self.prepare_dest_path(path_src, path_dest)
        check_if_can_operate(path_dest, path_src)

        final_dest_path = Util::FileUtil.eval_dest_path(path_src, path_dest)
        final_dest_path = File.expand_path final_dest_path
        FileUtils.mkdir_p final_dest_path

        final_dest_path
      end

      def self.check_if_can_operate(path_dest, path_src)
        return unless cannot_op(path_dest, path_src)

        msg = [
          'Cannot do file operation to child folder', "src  : #{path_src}", "dest : #{path_dest}"
        ].join('\n')
        raise msg
      end

      def self.cannot_op(path_dest, path_src)
        forbid_new_file_in_subfolder = Sicily.config.forbid_new_file_in_subfolder
        related = Util::FileUtil.related?(path_src, path_dest)

        forbid_new_file_in_subfolder && related
      end
    end

    module FileTask
      def mv(path_dest)
        path_dest = Base.prepare_dest_path(@path, path_dest)
        FileUtils.mv @path, path_dest
      end

      def cp(path_dest)
        path_dest = Base.prepare_dest_path(@path, path_dest)
        FileUtils.cp @path, path_dest
      end

      def rm
        FileUtils.rm @path
      end
    end
  end
end
