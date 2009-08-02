require File.dirname(__FILE__) + '/../spec_helper'

describe AtTheMovies::Parser do
  it "should act as a base class" do
    parser = AtTheMovies::Parser.new(nil)
    lambda { parser.parse }.should raise_error(NotImplementedError)
  end
end
