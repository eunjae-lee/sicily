# frozen_string_literal: true

require 'sicily/generator'

module Sicily
  RSpec.describe Generator do
    it 'has register_generator method' do
      expect do
        Sicily.register_generator
      end.not_to raise_error
    end

    it 'registers new generator' do
      prev_count = Sicily.generators.size

      Sicily.register_generator do |gen|
        gen.filename = '.sicily.god'
        gen.content = <<~CONTENT
          God.watch do |w|
            w.name = "sicily"
            w.start = "sicily monitor"
            w.dir = File.expand_path("\#{File.dirname(__FILE__)}/..")
            w.keepalive
          end
        CONTENT
        gen.post_generate_message = <<~MESSAGE
          Blah Blah
        MESSAGE
      end

      new_count = Sicily.generators.size
      expect(new_count).to eq(prev_count + 1)
    end

    it "doesn't do anything without block" do
      prev_count = Sicily.generators.size

      Sicily.register_generator

      new_count = Sicily.generators.size
      expect(new_count).to eq(prev_count)
    end
  end
end
