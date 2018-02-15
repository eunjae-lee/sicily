require "sicily/task/resize_task"
require "sicily/task/google_photo_task"
require "sicily/task/file_task"
require "sicily/util/file_util"

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
      file_task_op :mv, dest_path
    end

    def cp(dest_path)
      file_task_op :cp, dest_path
    end

    def rm
      Task::FileTask.rm @path
    end

    private
    def file_task_op(op, dest_path)
      cannot_op = Sicily.config.forbid_new_file_in_subfolder &&
          Util::FileUtil.is_related?(@path, dest_path)

      if cannot_op
        raise [
                  "Cannot #{op} to child folder",
                  "  src  : #{@path}",
                  "  dest : #{dest_path}",
              ].join("\n")
        return
      end

      final_dest_path = Util::FileUtil.eval_dest_path(@path, dest_path)
      Task::FileTask.public_send op, @path, final_dest_path
    end
  end
end