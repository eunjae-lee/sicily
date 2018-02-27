# frozen_string_literal: true

require 'sicily/task/dummy_task'

module Sicily
  module Task
    RSpec.describe DummyTask do
      it 'works fine' do
        path = 'dummy path'
        processor = FileProcessor.new(path)
        expect(processor.dummy).to eq(path)
      end
    end
  end
end
