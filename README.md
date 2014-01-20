# Numeric Nation Input Gem for Rails 3.2

## Info

Allow `,` as decimal part delimiter for AR's float typecasting from string.

## Installation

```ruby
# Gemfile
gem "numeric_nation_input", git: "http://github.com/netbrick/numeric_nation_input.git"
```

## Usage

```ruby
class TestModel < ActiveRecord::Base
  attr_accessible :attr1, :attr2

  numeric_nation_input :attr1, :attr2
end

model = TestModel.new(attr1: "1025,45")
model.attr1 #=> 1025.45 (Float)
```
