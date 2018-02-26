require "sicily/util/image_util"
require "fastimage_resize"

module Sicily
  module Task
    class SizeCalculator
      def self.size_to_fit(container_width, container_height, image_width, image_height)
        if container_width*image_height > container_height*image_width
          [(image_width*container_height/image_height).to_i, container_height]
        else
          [container_width, (image_height*container_width/image_width).to_i]
        end
      end
    end

    module ResizeTask
      def fit_if_photo(container_width, container_height)
        size = Util::ImageUtil.get_size(@path)
        dest_size = SizeCalculator.size_to_fit container_width, container_height, size[0], size[1]
        FastImage.resize(@path, dest_size[0], dest_size[1], :outfile => @path)
      end
    end
  end
end