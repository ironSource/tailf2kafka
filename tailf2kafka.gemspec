lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "tailf2kafka/version"
 
Gem::Specification.new do |s|
  s.name        = "tailf2kafka"
  s.version     = Tailf2Kafka::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alexander Piavlo"]
  s.email       = ["devops@supersonic.com"]
  s.homepage    = "http://github.com/SupersonicAds/tailf2kafka"
  s.summary     = "Watch and tail files with specified time based patterns and push them to kafka"
  s.description = "Watch and tail files with specified time based patterns and push them to kafka"
  s.license     = 'MIT'
  s.has_rdoc    = false 

  s.add_dependency('poseidon')
  s.add_dependency('snappy')
  s.add_dependency('hash_symbolizer')
  s.add_dependency('schash')
  s.add_dependency('rb-inotify')
  s.add_dependency('timers')

  s.add_development_dependency('rake')

  s.files         = Dir.glob("{bin,lib}/**/*") + %w(tailf2kafka.gemspec LICENSE README.md)
  s.executables   = Dir.glob('bin/**/*').map { |file| File.basename(file) }
  s.test_files    = nil
  s.require_paths = ['lib']
end
