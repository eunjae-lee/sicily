# frozen_string_literal: true

require 'fastimage'

module Sicily
  module Util
    class ImageUtil
      def self.get_size(path)
        size = FastImage.size(path)
        [size[0], size[1]]
      end
    end
  end
end
