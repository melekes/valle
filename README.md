# Valle [![Build Status](https://travis-ci.org/melekes/valle.svg?branch=master)](https://travis-ci.org/melekes/valle) [![Code Climate](https://codeclimate.com/github/melekes/valle/badges/gpa.svg)](https://codeclimate.com/github/melekes/valle) [![Gem Version](https://badge.fury.io/rb/valle.svg)](https://badge.fury.io/rb/valle)

Valle automatically creates validations for the minimum and maximum values of fields in your ActiveRecord model(s). No more worrying that string lengths or ID values will exceed the permissible DB limits!

For example, the maximum length of the `string` type in PostgreSQL is 255. Valle creates the following validator for you, so you no longer need to write it by hand:

```ruby
validates :field_name, length: { maximum: 255 }
```

Note: If you do not do this (and usually you are) and try to enter 2147483648 into a field of type `integer` (see the [Numeric types](http://www.postgresql.org/docs/9.2/static/datatype-numeric.html) section of PostgreSQL docs), you will get a 500 error.

Example:

    PG::Error: ERROR:  value "2147483648" is out of range for type integer
    : SELECT  "users".* FROM "users"  WHERE "users"."id" = $1 LIMIT 1

### Supported ActiveRecord field types

- `:primary_key`
- `:integer`
- `:string`
- `:text`

## Installation

Add this line to your application's Gemfile:

    gem 'valle'

And then execute:

    $ bundle

Or install it yourself:

    $ gem install valle

If you are using other framework than Rails (e.g. Sinatra), call `Valle::Hooks.init` method during the boot process.

## Usage

By default, this gem adds validators to all your ActiveRecord models. If that is the behavior you want, you don't need to tweak it.

However, you can skip some of them by adding the file `config/initializers/valle.rb` containing:

```ruby
Valle.configure do |config|
  config.exclude_models = %w(Post)
end
```

Also, you can disable it temporarily by setting the `enabled` configuration option to `false`.

```ruby
Valle.configure do |config|
  config.enabled = false
end
```

### Disabling Valle on specific attributes

There are cases where you need to skip validation for a particular attribute (see [#4](https://github.com/kaize/valle/issues/4)). For example, *CarrierWave* stores images temporarily in attributes, so calling `save` on them will fail because of its LengthValidator (255 characters maximum). You can disable Valle for such fields using the `exclude_attributes` configuration option:

```ruby
Valle.configure do |config|
  config.exclude_attributes = {
    'User' => %w(image)
  }
end
```

## Alternatives

There is a similar gem, called [validates_lengths_from_database](http://github.com/rubiety/validates_lengths_from_database). It solves only one part of the problem — applicable to strings. Valle, however, is designed to work with all possible field types.

## Developing

### Docker container

If you have [docker](http://www.docker.com/) installed on your machine, you can
spin up a sandbox and run test suite in a few seconds:

```
$ docker build -t valle .
$ docker run -it --rm -v "$PWD":/usr/src/lib valle bundle exec rake
```

Or simply use Makefile commands:

```
$ make docker_build
$ make docker_test
```

### Debugging Cucumber tests

Uncomment `@announce-output` tag at the top of the `.feature` file.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Run test suite (`rake test_suite`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

## Credits

Original authors:

- [Anton Kalyaev](http://github.com/melekes)
- [Andrew Kulakov](http://github.com/Andrew8xx8)
- [Alexander Kirillov](http://github.com/saratovsource)

Thank you to all our amazing [contributors](http://github.com/kaize/valle/contributors)!

## License

Valle is released under the [MIT License](http://www.opensource.org/licenses/MIT).
