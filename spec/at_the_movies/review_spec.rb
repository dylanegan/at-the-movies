require File.dirname(__FILE__) + '/../spec_helper'

describe AtTheMovies::Review do
  context "with a parsed review" do
    before do
      url = 'http://www.abc.net.au/atthemovies/txt/s1533013.htm'
      FakeWeb.register_uri(:get, url, :response => cached_page_for(url))
      mech = WWW::Mechanize.new
      page = mech.get(url)
      @review = AtTheMovies::Parsers::Review.parse(page)
    end

    it "should have a title" do
      @review.title.should == "Brokeback Mountain"
    end

    it "should have a classification" do
      @review.classification.should == "M"
    end

    it "should have a duration" do
      @review.duration.should == 134
    end

    it "should have a genre" do
      @review.genre.should == "Drama"
    end
  end
end
