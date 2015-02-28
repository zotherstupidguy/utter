Gem::Specification.new do |s|
  s.name        = 'utter'
  s.version     = '1.0.0.alpha'
  s.date        = '2015-03-01'
  s.summary     = "minimalistic REST API micro-framework!"
  s.description = "APIs uttered!"
  s.authors     = ["zotherstupidguy"]
  s.email       = 'zaotherstupidguy@gmail.com'
  s.files       = `git ls-files`.split("\n") - %w[.gitignore .travis.yml]
  s.homepage    = 'http://rubygems.org/gems/utter'
  s.license     = 'MIT'
end
