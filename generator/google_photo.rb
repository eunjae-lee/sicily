module Sicily
  Sicily.register_generator do |generator|
    generator.filename = "google_photo.rb"
    generator.content = <<-EOF
Sicily.configure_google do |config|
  config.id = "your id"
  config.pw = "your pw"
end
    EOF
    generator.post_generate_message = <<-EOF
To upload to Google Photos,
  turn on "Allowing less secure apps to access your account"
  : https://support.google.com/accounts/answer/6010255
  *USE AT YOUR OWN RISK*
    EOF
  end
end