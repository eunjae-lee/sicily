# frozen_string_literal: true

module Sicily
  def self.user_config_path
    "#{Dir.pwd}/config"
  end

  def self.lib_path
    File.dirname(__FILE__)
  end
end
