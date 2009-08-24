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
