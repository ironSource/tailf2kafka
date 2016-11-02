$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "tailf2kafka/version"
 
task :build do
  system "gem build tailf2kafka.gemspec"
end
 
task :release => :build do
  system "gem push tailf2kafka-#{Tailf2Kafka::VERSION}.gem --host https://ironsrc.artifactoryonline.com/ironsrc/api/gems/ssa-devops-gems"
end
