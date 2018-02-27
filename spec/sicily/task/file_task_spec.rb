# frozen_string_literal: true

require 'fileutils'

module Sicily
  module Task
    RSpec.describe FileTask do
      before(:each) do
        @tmp_path1 = "#{Dir.pwd}/tmp1"
        FileUtils.rm_rf(@tmp_path1)
        FileUtils.mkdir_p(@tmp_path1)

        @tmp_path2 = "#{Dir.pwd}/tmp2"
        FileUtils.rm_rf(@tmp_path2)
        FileUtils.mkdir_p(@tmp_path2)
      end

      after(:each) do
        FileUtils.rm_rf(@tmp_path1)
        FileUtils.rm_rf(@tmp_path2)
      end

      it 'copies' do
        expect(File.exist?("#{@tmp_path2}/test")).to eq(false)
        path = "#{@tmp_path1}/test"
        FileUtils.touch(path)
        FileProcessor.new(path).cp(@tmp_path2)
        File.exist?("#{@tmp_path2}/test")
        expect(File.exist?("#{@tmp_path2}/test")).to eq(true)
      end

      it 'moves' do
        expect(File.exist?("#{@tmp_path2}/test")).to eq(false)
        path = "#{@tmp_path1}/test"
        FileUtils.touch(path)
        FileProcessor.new(path).mv(@tmp_path2)
        File.exist?("#{@tmp_path2}/test")
        expect(File.exist?("#{@tmp_path2}/test")).to eq(true)
        expect(File.exist?(path)).to eq(false)
      end

      it 'removes' do
        path = "#{@tmp_path1}/test"
        FileUtils.touch(path)
        expect(File.exist?(path)).to eq(true)
        FileProcessor.new(path).rm
        expect(File.exist?(path)).to eq(false)
      end
    end
  end
end
