# Enumerator::Parallel

```ruby
require 'enumerator-parallel'

[1, 2, 3].par(in_processes: 3).each { |n| sleep 1; p n }

[1, 2, 3].par(in_threads: 3).map { |n| sleep 1; p n }
```
3 times fater! wow wow wow

#### You need to take care of side-effecting
```ruby
$global_var = 1
(0..10).to_a.par(in_threads: 3).map { |n| sleep rand; $global_var += 1 }
```
There are difference ↑ and ↓ :D

```ruby
$global_var = 1
(0..10).to_a.map { |n| sleep rand; $global_var += 1 }
```

## Installation

Have it your way.

    $ echo "gem 'enumerator-parallel'" >> Gemfile; bundle

or

    $ gem install enumerator-parallel


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

MIT license (© 2015 Kazuki Tanaka)
