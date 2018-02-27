# frozen_string_literal: true

module Sicily
  Sicily.register_generator do |generator|
    generator.filename = '.sicily.god'
    generator.content = <<~CONTENT
      God.watch do |w|
        w.name = 'sicily'
        w.start = 'SICILY_LOG=file sicily monitor'
        w.dir = File.expand_path("\#{File.dirname(__FILE__)}/..")
        w.keepalive
      end
    CONTENT
  end
end
