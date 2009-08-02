module AtTheMovies
  class Review
    attr_reader :title, :classification, :duration, :genre, :ratings

    def initialize(title, classification, duration, genre, ratings)
      @title = title
      @classification = classification
      @duration = duration
      @genre = genre
      @ratings = ratings
    end
  end
end
