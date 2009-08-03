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

  context "finding" do
    context "latest" do
      before do
        url = 'http://www.abc.net.au/atthemovies/review/'
        FakeWeb.register_uri(:get, url, :response => cached_page('reviews'))
        %w( s2625733 s2625742 s2625654 s2625717 s2634329 s2631026 ).each do |uri|
          FakeWeb.register_uri(:get, "http://www.abc.net.au/atthemovies/txt/#{uri}.htm", :response => cached_page("#{uri}.htm"))
        end
        @reviews = AtTheMovies::Review.latest
      end

      it "should contain the latest reviews only" do
        @reviews.collect { |review| review.title }.should == ["Public Enemies", "Coraline", "My Sister's Keeper", "Cedar Boys"]
      end
    end
  end
end
