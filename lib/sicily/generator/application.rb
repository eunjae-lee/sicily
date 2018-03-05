# frozen_string_literal: true

module Sicily
  Sicily.register_generator do |generator|
    generator.filename = '.application.rb'
    generator.load_on_start = true
    generator.content = <<~CONTENT
      Sicily.configure do |config|
        config.forbid_new_file_in_subfolder = true
        config.num_thread_pool = 1
        config.delay_on_file_monitoring = 30
        config.consume_on_start = true
      end
    CONTENT
  end
end
