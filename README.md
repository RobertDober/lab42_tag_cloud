[![Issue Count](https://codeclimate.com/github/RobertDober/lab42_tag_cloud/badges/issue_count.svg)](https://codeclimate.com/github/RobertDober/lab42_tag_cloud)
[![Gem Version](http://img.shields.io/gem/v/lab42_lab42_tag_cloud.svg)](https://rubygems.org/gems/lab42_lab42_tag_cloud)
[![CI](https://github.com/robertdober/lab42_tag_cloud/workflows/CI/badge.svg)](https://github.com/robertdober/lab42_tag_cloud/actions)
[![Coverage Status](https://coveralls.io/repos/github/RobertDober/lab42_tag_cloud/badge.svg?branch=main)](https://coveralls.io/github/RobertDober/lab42_tag_cloud?branch=main)


# Lab42::TagCloud

Creating Tag Clouds with gamma correct color values and styles from a simple DSL.

This is a port of [Elixir's tag_cloud](https://github.com/RobertDober/tag_cloud) to Ruby

## Installation:

##### With bundler

```ruby
  gem 'lab42_tag_cloud'
```

##### or simply

```sh
    gem install lab42_tag_cloud
```

## Usage:

A very simple DSL allows you to describe the size, color and thickness of your tag and each line of this DSL will be transformed into
some CSS and the text of the tag.

### Colors

Gamma correction for scaled colors

To create 13 different shades of a color, where 0 means transparent (#ffffff) and 12 opaque (original color value or #000000 as default) which are equally spaced for the human eye we use a gamma correction of 1/2.2 which seems to work very well on modern screens.

The result for all 13 shades for some colors can be seen [here](https://htmlpreview.github.io/?https://github.com/RobertDober/tag_cloud/blob/v0.1.0/examples/gamma_correction.html)

Right now the size of the scale and the gamma value cannot be modified but that could be easily implemented if desired.


Well let us describe the behavior of this DSL by means of [speculations](https://github.com/RobertDober/speculate_about).

### Context



# LICENSE

Copyright 2022 Robert Dober robert.dober@gmail.com

Apache-2.0 [c.f LICENSE](LICENSE)
<!-- SPDX-License-Identifier: Apache-2.0-->
