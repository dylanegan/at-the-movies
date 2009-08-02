require File.dirname(__FILE__) + '/../../spec_helper'

describe AtTheMovies::Parsers::Review do
  describe "parse" do
    before do
      url = 'http://www.abc.net.au/atthemovies/txt/s1533013.htm'
      FakeWeb.register_uri(:get, url, :response => cached_page_for(url))
      mech = WWW::Mechanize.new
      page = mech.get(url)
      @review = AtTheMovies::Parsers::Review.parse(page)
    end

    it "should return a Review object" do
      @review.should be_an_instance_of(AtTheMovies::Review)
    end
  end
end
