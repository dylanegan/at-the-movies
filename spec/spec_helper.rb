require 'rubygems'
require 'spec'
require 'fake_web'
require 'mechanize'
 
require File.join(File.dirname(__FILE__), '..', 'lib', 'at_the_movies')
 
SPEC_DIR = File.dirname(__FILE__) unless defined? SPEC_DIR
$:<< SPEC_DIR
 
# Don't allow real web requests during specs!
FakeWeb.allow_net_connect = false

%w( page ).each { |helper| require "helpers/#{helper}" }

Spec::Example::ExampleGroup.send(:include, PageHelperMethods)
