# frozen_string_literal: true

module Sicily
  module Task
    module DummyTask
      def dummy
        info 'dummy'
        @path
      end
    end
  end
end
