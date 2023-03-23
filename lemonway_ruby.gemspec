# frozen_string_literal: true

require_relative "lib/lemonway_ruby/version"

Gem::Specification.new do |s|
  s.name = "lemonway_ruby"
  s.version = "0.1.1"
  s.summary = "Ruby SDK for Lemonway API"
  s.description = "Ruby SDK for Lemonway API"
  s.authors = ["nicolas.vandenbogaerde@mipise.com"]
  s.email = ["nicolas.vandenbogaerde@mipise.com"]
  s.homepage = "https://github.com/MIPISE/LemonwayRuby"
  s.license = "MIT"

  s.required_ruby_version = ">= 3.1.1"

  s.files = `git ls-files`.split("\n")

  spec.add_dependency "activesupport", "~> 6.1.5"
  spec.add_dependency "faraday_middleware", "~> 1.2.0"

  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
end
