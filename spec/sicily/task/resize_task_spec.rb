# frozen_string_literal: true

require 'sicily/task/resize_task'
require 'sicily/util/image_util'
require 'fileutils'

module Sicily
  module Task
    RSpec.describe ResizeTask do
      before(:each) do
        @tmp_path = "#{Dir.pwd}/tmp"
        FileUtils.rm_rf(@tmp_path)
        FileUtils.mkdir_p(@tmp_path)
      end

      after(:each) do
        FileUtils.rm_rf(@tmp_path)
      end

      it 'resizes to fit' do
        [
          ['IMG_2407.JPG', 1000, 1000, 1000, 1000],
          ['IMG_2407_NO_EXIF.jpg', 1000, 1000, 1000, 1000],
          ['DSCF0008.JPG', 3000, 2000, 3000, 2000],
          ['DSCF0008.JPG', 3000, 3000, 3000, 2000],
          ['DSCF0063.JPG', 3000, 3000, 3000, 2000],
          ['DSCF0088.JPG', 3000, 3000, 3000, 2000]
        ].each do |item|
          filename = item[0]
          resize_param_width = item[1]
          resize_param_height = item[2]
          expected_width = item[3]
          expected_height = item[4]

          FileUtils.cp("#{Dir.pwd}/spec/assets/#{filename}", @tmp_path)

          copied_path = "#{@tmp_path}/#{filename}"
          FileProcessor
            .new(copied_path)
            .fit_if_photo(resize_param_width, resize_param_height)
          size = Util::ImageUtil.get_size(copied_path)

          expect(size[0]).to eq(expected_width)
          expect(size[1]).to eq(expected_height)
        end
      end
    end
  end
end
