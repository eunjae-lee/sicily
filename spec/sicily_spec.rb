# frozen_string_literal: true

RSpec.describe Sicily do
  it 'has a version number' do
    expect(Sicily::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).not_to eq(true)
  end

  it 'returns config' do
    expect(Sicily.config).not_to be_nil
  end

  it 'has default configs' do
    expect(Sicily.config.forbid_new_file_in_subfolder).to eq(true)
    expect(Sicily.config.num_thread_pool).to eq(50)
  end

  it 'works with configure_google' do
    expect do
      Sicily.configure_google
    end.not_to raise_error

    expect do
      Sicily.configure_google do |config|
        expect(config).not_to be_nil
      end
    end.not_to raise_error

    Sicily.configure_google do |config|
      expect do
        config.id = 'abcd'
        config.pw = 'def'
      end.not_to raise_error
    end

    expect(Sicily.config_google.id).to eq('abcd')
    expect(Sicily.config_google.pw).to eq('def')
  end

  it 'works with on' do
    # Sicily.on "/Users/paul/Downloads" do
    #   fit_if_photo 2000, 2000
    #   google_photo
    #   mv "/Users/paul/Desktop/testfolder"
    # end

    dummy_path = File.dirname(__FILE__)

    expect do
      Sicily.on dummy_path
    end.not_to raise_error
  end
end
