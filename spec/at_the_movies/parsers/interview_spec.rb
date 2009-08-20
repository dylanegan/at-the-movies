require File.dirname(__FILE__) + '/../../spec_helper'

describe AtTheMovies::Parsers::Interview do
  describe "parse" do
    before do
      url = 'http://www.abc.net.au/atthemovies/txt/s2642594.htm'
      FakeWeb.register_uri(:get, url, :response => cached_page_for(url))
      mech = WWW::Mechanize.new
      page = mech.get(url)
      @interview = AtTheMovies::Parsers::Interview.parse(page)
    end

    it "should return an Interview object" do
      @interview.should be_an_instance_of(AtTheMovies::Interview)
    end
  end
end
