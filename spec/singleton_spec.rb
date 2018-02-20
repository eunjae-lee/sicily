require "singleton"

RSpec.describe Singleton do
  class NotSingletonClass
    attr_accessor :foo

    def initialize
      @foo = "bar"
    end
  end

  class SingletonClass
    include Singleton

    attr_accessor :foo

    def initialize
      @foo = "bar"
    end
  end

  it "has foo when created normally" do
    expect(NotSingletonClass.new.foo).to eq("bar")
  end

  it "also has foo when created by singleton" do
    expect(SingletonClass.instance.foo).to eq("bar")
  end
end