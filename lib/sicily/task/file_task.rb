require "fileutils"
require "sicily/config"

module Sicily
  module Task
    class Base
      def self.prepare_dest_path(path_src, path_dest)
        cannot_op = Sicily.config.forbid_new_file_in_subfolder &&
            Util::FileUtil.is_related?(path_src, path_dest)

        if cannot_op
          raise [
                    "Cannot do file operation to child folder",
                    "  src  : #{path_src}",
                    "  dest : #{path_dest}",
                ].join("\n")
          return
        end

        final_dest_path = Util::FileUtil.eval_dest_path(path_src, path_dest)
        final_dest_path = File.expand_path final_dest_path
        FileUtils.mkdir_p final_dest_path

        final_dest_path
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
