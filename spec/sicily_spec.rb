RSpec.describe Sicily do
  it "has a version number" do
    expect(Sicily::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).not_to eq(true)
  end

  it "configure" do
    expect {
      Sicily.configure
    }.not_to raise_error

    expect {
      Sicily.configure do |config|
      end
    }.not_to raise_error

    Sicily.configure do |config|
      expect(config).not_to be_nil
    end

    Sicily.configure do |config|
      expect {
        config.forbid_mv_to_children_folder = false
        config.notify_when_done = true
        config.num_thread_pool = 49
      }.not_to raise_error
    end

    expect(Sicily.config).not_to be_nil
    expect(Sicily.config.forbid_mv_to_children_folder).to eq(false)
    expect(Sicily.config.notify_when_done).to eq(true)
    expect(Sicily.config.num_thread_pool).to eq(49)
  end
end
