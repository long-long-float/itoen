# Itoen

[![Build Status](https://travis-ci.org/long-long-float/itoen.svg)](https://travis-ci.org/long-long-float/itoen)

convert numeric to English string

## Installation

Add this line to your application's Gemfile:

    gem 'itoen'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itoen

## Usage

```ruby
require 'itoen'

puts 1.to_en # one
puts 777.to_en # seven hundred seventy-seven

# Supports big number!
puts (10**30).to_en #one nonillion

# Too big number :(
puts (10**350).to_en rescue ITOEN::TooBigError

puts 3.14.to_en # three point one four

puts -10.to_en # negative ten

puts ITOEN.itoen(1) # one
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/itoen/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
