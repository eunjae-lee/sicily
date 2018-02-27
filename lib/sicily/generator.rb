# frozen_string_literal: true

module Sicily
  class Generator
    attr_accessor :filename, :content, :post_generate_message
  end

  class << self
    attr_accessor :generators
  end
  Sicily.generators = []

  def self.register_generator(&block)
    return unless block_given?

    generator = Generator.new
    block.call generator
    Sicily.generators << generator
  end
end
