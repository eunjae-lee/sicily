require "sicily/util/file_util"

module Sicily
  module Util
    RSpec.describe FileUtil do
      it "is_related?" do
        expect(FileUtil.is_related?("ab", "ab/c")).to be(true)
        expect(FileUtil.is_related?("ab", "ab/c/d")).to be(true)
        expect(FileUtil.is_related?("ab/", "ab/c/d")).to be(true)
        expect(FileUtil.is_related?("ab/", "ab/c/d/")).to be(true)
        expect(FileUtil.is_related?("ab", "ab/")).to be(false)
        expect(FileUtil.is_related?("ab/", "ab/")).to be(false)
        expect(FileUtil.is_related?("ab/", "ab")).to be(false)
      end

      it "extract_time" do
        expect(FileUtil.extract_time("spec/assets/IMG_2407.JPG")).not_to be_nil
        expect(FileUtil.extract_time("spec/assets/IMG_2407_NO_EXIF.JPG")).not_to be_nil

        expect(FileUtil.eval_dest_path("spec/assets/IMG_2407.JPG", "dest_path/%Y/%m/%d")).to eq("dest_path/2018/01/27")
        expect(FileUtil.eval_dest_path("spec/assets/IMG_2407_NO_EXIF.JPG", "dest_path/%Y/%m/%d")).not_to eq("dest_path/2018/01/27")
      end
    end
  end
end