# Enumerator::Parallel

```ruby
require 'enumerator-parallel'

[1, 2, 3].par(processes: 3).each { |n| sleep 1; p n }
```
3 times fater! wow wow wow

`enumerator-parallel` keep order of `enumerator` \\(^o^)/

```ruby
[1, 2, 3].par(threads: 3).map { |n| sleep 1; p n }
#=> [1, 2, 3]

[1, 2, 3].par(proceses: 3).select { |n| sleep 1; n > 1 }
#=> [2, 3]

(1..10).par(threads: 10).reject { |n| sleep 1; n.odd? }
#=> [2, 4, 6, 8, 10]
```

```ruby
(1..10).par(threads: 10).all? { |n| n > 0 }
#=> true

(1..10).par(threads: 10).any? { |n| n == 10 }
#=> true
```

#### You need to take care of side-effecting
While keeping order of results, order of calling `block` is randomly.



```ruby
$global_var = 1
(0..10).par(threads: 3).map { |n| sleep rand; $global_var += 1 }
```
You could find difference between ↑ and ↓ :D

```ruby
$global_var = 1
(0..10).map { |n| sleep rand; $global_var += 1 }
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
