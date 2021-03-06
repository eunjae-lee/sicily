[![Gem Version](https://badge.fury.io/rb/sicily.svg)](https://badge.fury.io/rb/sicily)
[![Build Status](https://travis-ci.org/eunjae-lee/sicily.svg?branch=master)](https://travis-ci.org/eunjae-lee/sicily)

# Sicily

A rule-based photo organizer written in Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sicily'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sicily

### Install dependencies

Install a node package as:

    $ npm install -g upload-gphotos
    
Install ImageMagick

    $ brew install imagemagick

## Usage

### Generate config files

Go to your project path, and then execute:

    $ mkdir my-project
    $ cd my-project
    $ sicily generate

### Modify the generated files

`./config/rules.rb`

    Sicily.on '~/your_folder' do
      fit_if_photo 2000, 2000
      google_photo
      mv '~/your_another_folder/%Y/%m/%d'
    end
    
    Sicily.on '~/your_folder2' do
      fit_if_photo 1000, 1000
      cp '~/your_another_folder/%Y/%m/%d'
    end
    
    Sicily.on '~/your_folder3' do
      google_photo
      rm
    end

`./config/google_photo.rb` (optional)

    Sicily.configure_google do |config|
      config.id = 'your id'
      config.pw = 'your pw'
    end

### Start & Stop

If you want to monitor just during the current terminal session, then execute:

    $ sicily monitor
    
If you want to run a background job which runs forever, then execute:

    $ sicily start
    
If you want to stop that background job, then execute:

    $ sicily stop

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Adding a New Task

Refer to `lib/sicily/task/` and `spec/sicily/task/`.

You create any task as you want.

TaskLoader(`lib/sicily/task_loader.rb`) will load it automatically.

## TODO
* error handling
* logging

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eunjae-lee/sicily. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sicily project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/eunjae-lee/sicily/blob/master/CODE_OF_CONDUCT.md).
