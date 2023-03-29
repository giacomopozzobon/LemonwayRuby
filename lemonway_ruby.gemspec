Gem::Specification.new do |s|
  s.name = "lemonway_ruby"
  s.version = "0.2.0"
  s.summary = "Ruby SDK for Lemonway API"
  s.description = "Ruby SDK for Lemonway API"
  s.authors = ["nicolas.vandenbogaerde@mipise.com"]
  s.email = ["nicolas.vandenbogaerde@mipise.com"]
  s.homepage = "https://github.com/MIPISE/LemonwayRuby"
  s.license = "MIT"

  s.required_ruby_version = ">= 3.1.1"

  s.files = `git ls-files`.split("\n")

  s.add_dependency "activesupport", "~> 6.1.5"

  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"
  s.add_development_dependency "minitest-reporters"
end
