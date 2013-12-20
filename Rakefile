require "rake/testtask"

Rake::TestTask.new do |t|
  t.pattern = "test/test_*.rb"
end

task :default => :test

desc "build exe"
task :build do
  system "bundle exec ocra syslog-client.rb"
end
