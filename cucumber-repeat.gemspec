Gem::Specification.new do |s|
  s.name        = 'cucumber-repeat'
  s.version     = '0.0.3'
  s.date        = '2014-10-28'
  s.summary     = ""
  s.description = "This gem will auto repeat a scenario if it fails up to 2 additional times"
  s.authors     = ["Andrew Moore"]
  s.email       = 'mooreandrew@gmail.com'
  s.files       = Dir.glob('{lib}/**/*') + %w(LICENSE README.md)
  s.homepage    =
    'https://github.com/mooreandrew/cucumber-repeat'
  s.license       = 'MIT'
  s.add_dependency 'cucumber', '>= 1.3.17'
  s.add_dependency 'colorize', '>= 0.7.3'
end
