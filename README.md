[![Build Status](https://travis-ci.org/TaigaMikami/color_space_converter.svg?branch=master)](https://travis-ci.org/TaigaMikami/color_space_converter)
[![Coverage Status](https://coveralls.io/repos/github/TaigaMikami/color_space_converter/badge.svg?branch=master)](https://coveralls.io/github/TaigaMikami/color_space_converter?branch=master)

# ColorSpaceConverter

Welcome to ColorSpaceConverter gem!
It is a gem for easy conversion of color space such as rgb, xyz, lab.

## Corresponding color space
- rgb(hex)
- rgb
- xyz
- lab

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'color_space_converter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install color_space_converter

## Usage

### Instantiation

```ruby
require 'color_space_converter'

obj = ColorSpaceConverter.new

# Otherwise
# ColorSpaceConverter.new(color_space, element1(ex: r), element2(ex: g), element3(ex: b)) 
obj = ColorSpaceConverter.new('rgb', 128, 128, 128) 

```

### Calculation
```ruby
# to rgb
obj.calc_rgb

# to xyz
obj.calc_xyz

# to lab
obj.calc_lab

```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/color_space_converter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ColorSpaceConverter project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/color_space_converter/blob/master/CODE_OF_CONDUCT.md).

## Author
[TaigaMikami](https://github.com/TaigaMikami)

## TODO
Correspond to the following color space.
- [ ] HSV
- [ ] PCCS
- [ ] NCS
