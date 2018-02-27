# frozen_string_literal: true

module Sicily
  module Task
    module DummyTask
      def dummy
        puts 'This does nothing'
        @path
      end
    end
  end
end
