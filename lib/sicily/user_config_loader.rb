module Sicily
  def self.load_user_config
    return if $skip_loading_user_config

    [".google_photo.rb", "config.rb", "rules.rb"].each { |filename|
      path = "#{File.dirname(__FILE__)}/../../config/#{filename}"
      load(path) if File.exists?(path)
    }
  end
end