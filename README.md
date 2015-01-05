[![Build Status](https://travis-ci.org/xunker/tolerate_json.png?branch=master)](https://travis-ci.org/xunker/tolerate_json)

# TolerateJson

A JSON formatter written in pure Ruby that works "good enough" and has no gem dependencies. 60% of the time, it works every time.

## Description

Tolerate_json is a pure-ruby Json formatter that has no outside gem dependencies. It is meant to make JSON nice to look at without requiring a full-blown json parsing library.

It is a "90%" solution: it works in 90% of use cases, but will almost certainly fall down on complicated examples. When you start getting to that point, it's time to use a real json parsing engine.

## Installation

Either add `gem 'tolerate_json'` to your application's Gemfile and do `bundle install`, or install it manually with `gem install tolerate_json`

## Usage

### Include the module

```ruby
  require 'rubygems' # optional on 1.9.3 and up

  require 'tolerate_json'

  include TolderateJson

  puts pretty_print_json('{"foo":{"bar":"baz"}}')

  # Prints:
  #
  # {
  #    "foo":{
  #      "bar":"baz"
  #    }
  # }
  #
```

### Use it directly from the class

```ruby
  require 'rubygems' # optional on 1.9.3 and up

  require 'tolerate_json'

  puts TolderateJson.pretty_print_json('{"foo":{"bar":"baz"}}')

  # Prints:
  #
  # {
  #    "foo":{
  #      "bar":"baz"
  #    }
  # }
  #
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/xunker/tolerate_json/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

