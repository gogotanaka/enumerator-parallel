# Enumerable::Parallel

```ruby
require 'enumerable-parallel'

[1, 2, 3].paralell(in_processes: 3).each { |n| sleep 1; p n }

[1, 2, 3].paralell(in_threads: 3).map { |n| sleep 1; p n }
```

## Installation

Have it your way.

    $ echo "gem 'enumerable-parallel'" >> Gemfile; bundle

or

    $ gem install enumerable-parallel


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

MIT license (© 2015 Kazuki Tanaka)
