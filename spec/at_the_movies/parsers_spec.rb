require File.dirname(__FILE__) + '/../spec_helper'

describe AtTheMovies::Parsers do
  describe "for" do
    context "with a review page" do
      before do
        url = 'http://www.abc.net.au/atthemovies/txt/s1533013.htm'
        FakeWeb.register_uri(:get, url, :response => cached_page_for(url))
        @parsed = AtTheMovies::Parsers.for(url)
      end

      it "should return a Review object" do
        @parsed.should be_an_instance_of(AtTheMovies::Review)
      end
    end

    context "using only" do
      before do
        url = 'http://www.abc.net.au/atthemovies/s2634329.htm'
        FakeWeb.register_uri(:get, url, :response => cached_page_for(url))
        @parsed = AtTheMovies::Parsers.for(url, :only => "review")
      end

      it "should return nothing" do
        @parsed.should be_nil
      end 
    end
  end
end
