require_relative "lib/lab42/tag_cloud/version"
version = Lab42::TagCloud::VERSION

description = <<~DESCRIPTION
  Creating Tag Clouds with gamma correct color values and styles from a simple DSL.

  This is a port of Elixir's tag_cloud https://github.com/RobertDober/tag_cloud to Ruby
DESCRIPTION

Gem::Specification.new do |s|
  s.name        = 'lab42_tag_cloud'
  s.version     = version
  s.summary     = 'Simple DSL for nicely styled, gamma corrected Tag Clouds'
  s.description = description
  s.authors     = ["Robert Dober"]
  s.email       = 'robert.dober@gmail.com'
  s.files       = Dir.glob("lib/**/*.rb")
  s.files      += %w[LICENSE README.md]
  s.homepage    = "https://github.com/robertdober/lab42_tag_cloud"
  s.licenses    = %w[Apache-2.0]

  s.required_ruby_version = '>= 3.1.0'
end
