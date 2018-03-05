# frozen_string_literal: true

require 'sicily/util/image_util'
require 'mini_magick'

module Sicily
  module Task
    module ResizeTask
      def fit_if_photo(container_width, container_height)
        info "fit_if_photo to #{container_width}x#{container_height}"
        MiniMagick::Image.new(@path) do |image|
          image.resize "#{container_width}x#{container_height}>"
        end
      end
    end
  end
end
