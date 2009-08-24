# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{at-the-movies}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dylan Egan"]
  s.date = %q{2009-08-24}
  s.description = %q{Scraper for http://abc.net.au/atthemovies}
  s.email = %q{dylanegan@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
     "Rakefile",
     "VERSION",
     "lib/at_the_movies.rb",
     "lib/at_the_movies/interview.rb",
     "lib/at_the_movies/parser.rb",
     "lib/at_the_movies/parsers.rb",
     "lib/at_the_movies/parsers/interview.rb",
     "lib/at_the_movies/parsers/review.rb",
     "lib/at_the_movies/review.rb",
     "lib/at_the_movies/version.rb",
     "lib/core_ext.rb",
     "lib/core_ext/enumerable.rb",
     "spec/at_the_movies/interview_spec.rb",
     "spec/at_the_movies/parser_spec.rb",
     "spec/at_the_movies/parsers/interview_spec.rb",
     "spec/at_the_movies/parsers/review_spec.rb",
     "spec/at_the_movies/parsers_spec.rb",
     "spec/at_the_movies/review_spec.rb",
     "spec/helpers/page.rb",
     "spec/pages/reviews",
     "spec/pages/s1533013.htm",
     "spec/pages/s2625654.htm",
     "spec/pages/s2625717.htm",
     "spec/pages/s2625733.htm",
     "spec/pages/s2625742.htm",
     "spec/pages/s2631026.htm",
     "spec/pages/s2634329.htm",
     "spec/pages/s2642594.htm",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/abcde/at-the-movies}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Pulling that shit in yo!}
  s.test_files = [
    "spec/at_the_movies/interview_spec.rb",
     "spec/at_the_movies/parser_spec.rb",
     "spec/at_the_movies/parsers/interview_spec.rb",
     "spec/at_the_movies/parsers/review_spec.rb",
     "spec/at_the_movies/parsers_spec.rb",
     "spec/at_the_movies/review_spec.rb",
     "spec/helpers/page.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mechanize>, [">= 0"])
    else
      s.add_dependency(%q<mechanize>, [">= 0"])
    end
  else
    s.add_dependency(%q<mechanize>, [">= 0"])
  end
end
