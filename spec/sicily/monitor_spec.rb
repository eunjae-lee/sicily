module Sicily
  RSpec.describe Monitor do
    it "does something useful" do
      expect(false).not_to eq(true)
    end

    it "know the number of threads to create" do
      expect(Config.instance.num_thread_pool).to be > 0
      # expect(Monitor.new.num_thread_pool).to be > 0
    end
  end
end