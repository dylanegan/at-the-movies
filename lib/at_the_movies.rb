require 'mechanize'

$:.unshift File.dirname(__FILE__) + '/at_the_movies'

%w( interview parser parsers review ).each { |lib| require lib }

require File.dirname(__FILE__) + '/core_ext'
