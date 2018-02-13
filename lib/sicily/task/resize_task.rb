require "mini_magick"

module Sicily
  module Task
    class ResizeTask
      def self.fit_if_photo(path, width, height)
        image = MiniMagick::Image.new(path)
        if image.valid?
          image.resize "#{width}x#{height}>"
        end
      end
    end
  end
end