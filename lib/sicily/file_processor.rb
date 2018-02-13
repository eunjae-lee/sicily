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
      Task::FileTask.mv @path, dest_path
    end
  end
end