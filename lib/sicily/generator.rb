# frozen_string_literal: true

module Sicily
  class << self
    attr_accessor :generators
  end

  Sicily.generators = []

  class Generator
    attr_accessor :filename, :content, :post_generate_message, :load_on_start
  end

  def self.register_generator(&block)
    return unless block_given?

    generator = Generator.new
    block.call generator
    Sicily.generators << generator
  end

  def self.load_generators
    Dir["#{File.dirname(__FILE__)}/../../generator/*.rb"].each do |file|
      file = File.expand_path file
      Sicily.logger.debug "Load generator : #{file}"
      require file
    end
  end

  load_generators
end
