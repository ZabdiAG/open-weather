Gem::Specification.new do |s|
  s.name              = 'weather'
  s.version           = '0.0.0'
  s.date              = '2016-12-08'
  s.summary           = 'Weather consulting gem'
  s.description       = 'A gem to consult weather api'
  s.authors           = ["Luis Aguilera"]
  s.email             = "aguilera.glz.luis@gmail.com"
  s.homepage          = "https://github.com/ZabdiAG/weather"
  s.license           = 'MIT'

  s.files             = ['lib/weather/units.rb','lib/weather.rb']
  s.test_files        = spec.files.grep(%r{^(test|spec|features)/})
  s.require_paths     = ["lib"]

  s.add_dependency 'json'
  s.add_dependency 'net/http'

  s.add_development_dependency "rspec", "~> 3.4"

end
