# frozen_string_literal: true

module Sicily
  Sicily.register_generator do |generator|
    generator.filename = 'google_photo.rb'
    generator.load_on_start = true
    generator.content = <<~CONTENT
      Sicily.configure_google do |config|
        config.id = 'your id'
        config.pw = 'your pw'
      end
    CONTENT
    generator.post_generate_message = <<~MESSAGE
      To upload to Google Photos,
        turn on "Allowing less secure apps to access your account"
        : https://support.google.com/accounts/answer/6010255
        *USE AT YOUR OWN RISK*
    MESSAGE
  end
end
