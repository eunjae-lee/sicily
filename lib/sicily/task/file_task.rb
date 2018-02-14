require "fileutils"
require "sicily/config"

module Sicily
  module Task
    class FileTask
      def self.mv(path_src, path_dest)
        file_op :mv, path_src, path_dest
      end

      def self.cp(path_src, path_dest)
        file_op :cp, path_src, path_dest
      end

      private
      def self.file_op(op, path_src, path_dest)
        path_src = File.expand_path path_src
        path_dest = File.expand_path path_dest

        FileUtils.mkdir_p path_dest
        FileUtils.public_send op, path_src, path_dest
      end
    end
  end
end
