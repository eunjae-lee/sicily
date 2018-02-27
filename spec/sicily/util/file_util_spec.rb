# frozen_string_literal: true

require 'sicily/util/file_util'

module Sicily
  module Util
    RSpec.describe FileUtil do
      it 'is_related?' do
        expect(FileUtil.related?('ab', 'ab/c')).to be(true)
        expect(FileUtil.related?('ab', 'ab/c/d')).to be(true)
        expect(FileUtil.related?('ab/', 'ab/c/d')).to be(true)
        expect(FileUtil.related?('ab/', 'ab/c/d/')).to be(true)
        expect(FileUtil.related?('ab', 'ab/')).to be(false)
        expect(FileUtil.related?('ab/', 'ab/')).to be(false)
        expect(FileUtil.related?('ab/', 'ab')).to be(false)
      end

      it 'extract_time' do
        path = 'spec/assets/IMG_2407.JPG'
        expect(FileUtil.extract_time(path)).not_to be_nil

        path = 'spec/assets/IMG_2407_NO_EXIF.JPG'
        expect(FileUtil.extract_time(path)).not_to be_nil

        dest_path_expression = 'dest_path/%Y/%m/%d'
        spec_asset_path = 'spec/assets'

        src_path = "#{spec_asset_path}/IMG_2407.JPG"
        eval_dest_path = FileUtil.eval_dest_path(src_path, dest_path_expression)
        expect(eval_dest_path).to eq('dest_path/2018/01/27')

        src_path = "#{spec_asset_path}/IMG_2407_NO_EXIF.JPG"
        eval_dest_path = FileUtil.eval_dest_path(src_path, dest_path_expression)
        expect(eval_dest_path).not_to eq('dest_path/2018/01/27')
      end
    end
  end
end
