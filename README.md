[![Gem Version](https://badge.fury.io/rb/sicily.svg)](https://badge.fury.io/rb/sicily)

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

And install a node package as:

    $ npm install -g upload-gphotos

## Usage

Go to your project path, and then execute:

    $ sicily generate
    
Modify the generated files:

    ./config/google_photo.rb
    ./config/rules.rb

If you want to monitor just during the current terminal session, then execute:

    $ sicily monitor
    
If you want to run a background job which runs forever, then execute:

    $ sicily start
    
If you want to stop that background job, then execute:

    $ sicily stop

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## TODO
* error handling
* logging

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eunjae-lee/sicily. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sicily project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/eunjae-lee/sicily/blob/master/CODE_OF_CONDUCT.md).
