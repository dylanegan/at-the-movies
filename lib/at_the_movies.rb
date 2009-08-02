$:.unshift File.dirname(__FILE__) + '/at_the_movies'

%w( parser ).each { |lib| require lib }
