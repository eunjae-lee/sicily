require "sicily/task/resize_task"
require "sicily/task/google_photo_task"
require "sicily/task/file_task"

module Sicily
  class FileProcessor
    def initialize(path)
      @path = path
    end

    def fit_if_photo(width, height)
      Task::ResizeTask.fit_if_photo @path, width, height
    end

    def google_photo
      Task::GooglePhotoTask.upload @path
    end

    def mv(dest_path)
      cannot_move = Sicily.config.forbid_mv_to_children_folder &&
          FileUtil.is_related?(@path, dest_path)

      if cannot_move
        raise [
                  "Cannot move to children folder",
                  "  src  : #{dir_src}",
                  "  dest : #{path_dest}",
              ].join("\n")
        return
      end

      Task::FileTask.mv @path, dest_path
    end
  end
end