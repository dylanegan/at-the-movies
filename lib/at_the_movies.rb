$:.unshift File.dirname(__FILE__) + '/at_the_movies'

%w( parser parsers review ).each { |lib| require lib }
