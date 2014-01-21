# Numeric Nation Input Gem for Rails 3.2
[![Build Status](https://travis-ci.org/netbrick/numeric_nation_input.png?branch=master)](https://travis-ci.org/netbrick/numeric_nation_input)
[![Gem Version](https://badge.fury.io/rb/numeric_nation_input.png)](http://badge.fury.io/rb/numeric_nation_input)

## Info

Allow `,` and ` ` as decimal part delimiter for AR's float typecasting from string.

## Installation

```ruby
# Gemfile
gem "numeric_nation_input"
```

## Usage

```ruby
class TestModel < ActiveRecord::Base
  attr_accessible :attr1, :attr2

  numeric_nation_input :attr1, :attr2
end

model = TestModel.new(attr1: "1 025,45")
model.attr1 #=> 1025.45 (Float)
```
