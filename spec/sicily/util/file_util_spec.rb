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
    end
  end
end