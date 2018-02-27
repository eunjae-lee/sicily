# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sicily/version'

Gem::Specification.new do |spec|
  spec.name          = 'sicily'
  spec.version       = Sicily::VERSION
  spec.authors       = ['Paul Eunjae Lee']
  spec.email         = ['paul@valuepotion.com']

  spec.summary       = 'A rule-based photo organizer written in Ruby'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/eunjae-lee/sicily'
  spec.license       = 'MIT'

  spec.metadata = {
    'changelog_uri' => 'https://github.com/eunjae-lee/sicily/blob/master/CHANGELOG.md'
  }

  spec.post_install_message = <<~MESSAGE
    To finish installation, please execute the following:
      $ npm install -g upload-gphotos

    And Libgd is required for this gem. Please install it like the following:
      $ brew install gd
  MESSAGE

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3.1'

  spec.add_dependency 'concurrent-ruby', '~> 1.0.5'
  spec.add_dependency 'exifr', '~> 1.3.3'
  spec.add_dependency 'fastimage', '~> 2.1.1'
  spec.add_dependency 'fastimage_resize', '~> 2.0.3'
  spec.add_dependency 'god', '~> 0.13.7'
  spec.add_dependency 'listen', '~> 3.1.5'
  spec.add_dependency 'terminal-notifier', '~> 2.0.0'
  spec.add_dependency 'whenever', '~> 0.10.0'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
