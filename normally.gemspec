$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

NORMALLY_VERSION = '0.0.1'

Gem::Specification.new do |s|
  s.name        = "normally"
  s.version     = NORMALLY_VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = "MIT"
  s.authors     = ["Ben Christel"]
  s.homepage    = "http://github.com/benchristel/normally"
  s.summary     = "normally-#{NORMALLY_VERSION}"
  s.description = "Prioritize the happy path."
  s.files            = `git ls-files -- lib/*`.split("\n")
  s.files           += ["License.txt"]
  s.test_files       = `git ls-files -- {spec}/*`.split("\n")
  s.extra_rdoc_files = [ "README.md" ]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end
