require "fileutils"
require "sicily/config"

module Sicily
  module Task
    class FileTask
      def self.mv(path_src, path_dest)
        path_src = File.expand_path path_src
        path_dest = File.expand_path path_dest

        if Sicily.config.forbid_mv_to_children_folder
          dir_src = File.dirname path_src
          if path_dest.start_with? dir_src
            raise [
              "Cannot move to children folder",
              "  src  : #{dir_src}",
              "  dest : #{path_dest}",
            ].join("\n")
            return
          end
        end

        FileUtils.mkdir_p path_dest
        FileUtils.mv path_src, path_dest
      end
    end
  end
end
