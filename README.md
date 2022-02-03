[![Issue Count](https://codeclimate.com/github/RobertDober/lab42_tag_cloud/badges/issue_count.svg)](https://codeclimate.com/github/RobertDober/lab42_tag_cloud)
[![Gem Version](http://img.shields.io/gem/v/lab42_tag_cloud.svg)](https://rubygems.org/gems/lab42_tag_cloud)
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

### Context: The DSL

The DSL is a very simple string with 3 white space separated words, of which the first is a color specification which we
speculate about below, the second a `font size` in CSS (defaulting to `pt` if only a number is specified) and the third
the `font weight` as an optional integer with defaults to `100`

This simply is translated to HTML style attributes as follows:

Given the following DSL strings
```ruby
    include Lab42::TagCloud

     let(:blue_bold) { "blue 10 800" }
     let(:dgr_shaded) { "10/darkgoldenrod 1.2em" }
     let(:explicit) { "6/#2f3ab0 30px 450" }
```

Then the `to_style` method will yield the following results
```ruby
    expect(to_style(blue_bold)).to eq("color: #0000ff; font-size: 10pt; font-weight: 800;")
    expect(to_style(dgr_shaded)).to eq("color: #995061; font-size: 1.2em;")
    expect(to_style(explicit)).to eq("color: #695676; font-size: 30px; font-weight: 450;")
```

#### Context: Colors

Given we include the module:
```ruby
    include Lab42::TagCloud
```

Then we can see some transformation for colors, e.g. shade 11 of black can be expressed in different ways
```ruby
    gray = "525252"
    expect(color_value(11)).to eq(gray)
    expect(color_value("11")).to eq(gray)
    expect(color_value("11/black")).to eq(gray)
    expect(color_value("11/#000000")).to eq(gray)
```

And we can also use all web color names
```ruby
    expect(color_value("10/blue")).to eq("7171ff")
    expect(color_value("10/lime")).to eq("71ff71")
```

And we can add underscores for readability to the color names
```ruby
    expect(color_value("4/medium_slate_blue")).to eq("0d16e0")
```

#### Context: Convenience Helpers

Now we have already everything we need to create nice tag clouds, e.g. with `ERB`, however
with the API described so far we would need to write code like the following:

```eruby
      <% somd_data_source.each do |datum| %>
         ...
         <span style="<%= Lab42::TagCloud.to_style(datum.dsl) %>"><%= datum.tag %></span>
```

However if we had, say a helper, that would operate on objects that respond to `dsl` and `tag`, or `[:dsl]` and `[:tag]`,
then we could do very nice things like

```eruby
    <%= some_data_source.map { Lab42::TagCloud.tag_from_object(_1, tag: "span") } %>
```

would that not be great?

Well guess what it _is_ _great_, and the helper is called `tag_from_object` indeed

Given an `OpenStruct` and a `Hash` instance of the required format
```ruby
    let(:ostruct) { OpenStruct.new(tag: "Ruby", dsl: "10/red 1.2em") }
    let(:hash) { {tag: "Elixir", dsl: "blue 1.5em 800"} }
```

Then we can obtain tags from these objects
```ruby
    expect(tag_from_object(ostruct)).to eq(%{<span style="color: #ff7171; font-size: 1.2em;">Ruby</span>})
    expect(tag_from_object(hash, tag: :div, class: "some-class"))
      .to eq(%{<div class="some-class" style="color: #0000ff; font-size: 1.5em; font-weight: 800;">Elixir</div>})
```

Typically such tag clouds can than be easily constructed from external data sources like JSON or YAML

# LICENSE

Copyright 2022 Robert Dober robert.dober@gmail.com

Apache-2.0 [c.f LICENSE](LICENSE)
<!-- SPDX-License-Identifier: Apache-2.0-->
