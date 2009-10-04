begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "at-the-movies"
    gemspec.summary = "Pulling that shit in yo!"
    gemspec.description = "Scraper for http://abc.net.au/atthemovies"
    gemspec.email = "dylanegan@gmail.com"
    gemspec.homepage = "http://github.com/abcde/at-the-movies"
    gemspec.authors = ["Dylan Egan"]
    gemspec.files = %w(README.markdown Rakefile VERSION) + Dir.glob("{lib,spec}/**/*")
    gemspec.add_dependency 'mechanize'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require File.dirname(__FILE__) + '/tmp/vendor/environment'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new(:spec) do |t|
  desc "Run all specs in spec directory"
  t.spec_opts = ['--options', "\"spec/spec.opts\""]
  t.spec_files = FileList['spec/**/*_spec.rb']
end

desc "Run all specs by default"
task :default => :spec
