RSpec.describe Sicily do
  it "has a version number" do
    expect(Sicily::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).not_to eq(true)
  end

  it "works with configure_google" do
    expect {
      Sicily.configure_google
    }.not_to raise_error

    expect {
      Sicily.configure_google do |config|
        expect(config).not_to be_nil
      end
    }.not_to raise_error

    Sicily.configure_google do |config|
      expect {
        config.id = "abcd"
        config.pw = "def"
      }.not_to raise_error
    end
  end

  it "works with on" do
    # Sicily.on "/Users/paul/Downloads" do
    #   fit_if_photo 2000, 2000
    #   google_photo
    #   mv "/Users/paul/Desktop/testfolder"
    # end

    dummy_path = File.dirname(__FILE__)

    expect {
      Sicily.on dummy_path
    }.not_to raise_error
  end
end
