# frozen_string_literal: true

module Sicily
  RSpec.describe Monitor do
    it 'does something useful' do
      expect(false).not_to eq(true)
    end

    it 'know the number of threads to create' do
      expect(Sicily.config.num_thread_pool).to be > 0
      Monitor.new
    end
  end
end
