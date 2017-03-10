# tagenv [![Build Status](https://secure.travis-ci.org/toyama0919/tagenv.png?branch=master)](http://travis-ci.org/toyama0919/tagenv)

ec2 instance tag apply environment variables.

## Settings

```sh
export AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXX
export AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
export AWS_REGION=ap-northeast-1
```

* support environment variables and iam role.

## Examples

```ruby
require 'tagenv'

Tagenv::Env.load(prefix: 'EC2TAG_')

p ENV
# {"EC2TAG_Group"=>"group_a", "EC2TAG_Roles"=>"front", "EC2TAG_Stages"=>"staging", "EC2TAG_Name"=>"feweb07", "EC2TAG_Project"=>"project_a"}
```

## Installation

Add this line to your application's Gemfile:

```sh
gem 'tagenv'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install tagenv
```

## Synopsis

```sh
$ tagenv
```

## Future

* Support provider GCP.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](../../pull/new/master)

## Information

* [Homepage](https://github.com/toyama0919/tagenv)
* [Issues](https://github.com/toyama0919/tagenv/issues)
* [Documentation](http://rubydoc.info/gems/tagenv/frames)
* [Email](mailto:toyama0919@gmail.com)
