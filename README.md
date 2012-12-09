# Valle [![Build Status](https://secure.travis-ci.org/kaize/valle.png "Build Status")](http://travis-ci.org/kaize/valle) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/kaize/valle)

Valle adds validators to all the fields of your ActiveRecord models,
so you should not think that string length or ID value exceeds the permissible limits.

For example, maximum length of the string in PostgreSQL is 255. We will
setup the following validator for you, so you don't need to write it by
hands.

    validates :field_name, length: { maximum: 255 }

Note: If you do not do this (and usually you are) and try to enter 2147483648 into the field with type: `interger` (see [Numeric types](http://www.postgresql.org/docs/9.2/static/datatype-numeric.html) section of PostgreSQL docs), you will get 500 error.

Example:

    PG::Error: ERROR:  value "2147483648" is out of range for type integer
    : SELECT  "users".* FROM "users"  WHERE "users"."id" = $1 LIMIT 1

There is a simular gem, called [validates_lengths_from_database](http://github.com/rubiety/validates_lengths_from_database). It solves only one part -
applicable to strings. This gem is designed to work with all possible field types.

## Installation

Add this line to your application's Gemfile:

    gem 'valle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install valle

## Usage

By default, this gem adds validators to all your ActiveRecord models.
This means that, basically, you don't need to tweak it.

However, you could tell him directly what models it should take into account by adding `config/initializers/valle.rb`:

    Valle.configure do |config|
      config.models = %w(User, Post)
    end

Also, you should be able to turn it off temporary by setting `enabled` option to `false`.

    Valle.configure do |config|
      config.enabled = false
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Run test suite (`rake test_suite`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

## Core team

- [Anton Kalyaev](http://github.com/akalyaev)
- [Andrew Kulakov](http://github.com/Andrew8xx8)
- [Alexander Kirillov](http://github.com/saratovsource)
