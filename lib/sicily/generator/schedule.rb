# frozen_string_literal: true

module Sicily
  Sicily.register_generator do |generator|
    generator.filename = '.schedule.rb'
    generator.content = <<~CONTENT
      every :hour do
        god_file = File.expand_path("\#{File.dirname(__FILE__)}/.sicily.god")
        command "god -c \#{god_file}"
      end
    CONTENT
  end
end
