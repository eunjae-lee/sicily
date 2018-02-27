# frozen_string_literal: true

require 'sicily/util/image_util'

module Sicily
  module Util
    RSpec.describe ImageUtil do
      it 'get sizes correctly' do
        [
          ['DSCF0008.JPG', 6000, 4000],
          ['DSCF0063.JPG', 6000, 4000],
          ['DSCF0088.JPG', 6000, 4000],
          ['IMG_2407_NO_EXIF.jpg', 3024, 3024],
          ['IMG_2407.JPG', 3024, 3024]
        ].each do |item|
          filename = item[0]
          expected_width = item[1]
          expected_height = item[2]

          size = ImageUtil.get_size("#{Dir.pwd}/spec/assets/#{filename}")
          expect(size[0]).to eq(expected_width)
          expect(size[1]).to eq(expected_height)
        end
      end
    end
  end
end
