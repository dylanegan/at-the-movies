module AtTheMovies
  class Review
    attr_reader :title, :classification, :date, :duration, :genre, :ratings, :url

    def self.latest
      page = WWW::Mechanize.new.get('http://www.abc.net.au/atthemovies/review/')
      page.search('table.sideRating').first.css('a').inject([]) do |array, a|
        page = AtTheMovies::Parsers.for(a['href'], :only => "review")
        array << page
        array
      end.compact
    end

    def initialize(title, classification, date, duration, genre, ratings, url)
      @title = title
      @classification = classification
      @duration = duration
      @genre = genre
      @date = date
      @ratings = ratings
      @url = url
    end

    def rating(rater = nil)
      return total_rating unless rater
      @ratings[rater.to_s.capitalize]
    end

    def total_rating
      @ratings.inject(0) { |i,p| i += p[1]; i }
    end
  end
end
