module Sicily
  module Util
    class ImageUtil
      def self.get_size(path)
        image = MiniMagick::Image.new(path)
        [image.width, image.height]
      end
    end
  end
end
