require File.dirname(__FILE__) + '/../spec_helper'

describe AtTheMovies::Interview do
  context "with a parsed interview" do
    before do
      url = 'http://www.abc.net.au/atthemovies/txt/s2642594.htm'
      FakeWeb.register_uri(:get, url, :response => cached_page_for(url))
      mech = WWW::Mechanize.new
      page = mech.get(url)
      @interview = AtTheMovies::Parsers::Interview.parse(page)
    end

    it "should have a title" do
      @interview.title.should == "The Cove Interview"
    end

    it "should have a date" do
      @interview.date.to_s.should == "2009-08-19"
    end

    it "should have an interviewee" do
      @interview.interviewee.should == "filmmaker Louie Psihoyos"
    end

    it "should have an interviewer" do
      @interview.interviewer.should == "David"
    end

    it "should have a url" do
      @interview.url.should == "http://www.abc.net.au/atthemovies/txt/s2642594.htm"
    end
  end
end
