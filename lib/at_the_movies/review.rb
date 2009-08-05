module AtTheMovies
  class Review
    attr_reader :title, :classification, :date, :duration, :genre, :ratings

    def self.latest
      page = WWW::Mechanize.new.get('http://www.abc.net.au/atthemovies/review/')
      page.search('table.sideRating').first.css('a').inject([]) do |array, a|
        page = AtTheMovies::Parsers.for(a['href'], :only => "review")
        array << page
        array
      end.compact
    end

    def initialize(title, classification, date, duration, genre, ratings)
      @title = title
      @classification = classification
      @duration = duration
      @genre = genre
      @date = date
      @ratings = ratings
    end
  end
end
