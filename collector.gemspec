# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "collector/version"

Gem::Specification.new do |s|
  s.name        = "collector"
  s.version     = Collector::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matthew Kocher"]
  s.email       = ["kocher@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A rack app for collecting and logging statistics}
  s.description = %q{Collector is not ready for public use yet, please check back later.}

  s.rubyforge_project = "collector"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "rack"
end
