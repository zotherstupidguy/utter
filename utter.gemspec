Gem::Specification.new do |s|
  s.name        = 'utter'
  s.version     = '1.0.0.alpha'
  s.date        = '2015-03-01'
  s.summary     = "The way to create web microservices in ruby!"
  s.description = "Utter provides a sinatra-like web DSL plus a great console commands for creating, versioning and managing your microservices overtime."
  s.authors     = ["zotherstupidguy"]
  s.email       = 'zaotherstupidguy@gmail.com'
  #s.files       = `git ls-files`.split("\n") - %w[.gitignore .travis.yml]
  s.files       = ["lib/utter.rb", "lib/utter/api.rb", "lib/utter/ds.rb", "lib/utter/logger.rb"]
  s.executables << 'utter'
  s.homepage    = 'http://rubygems.org/gems/utter'
  s.license     = 'MIT'
end
