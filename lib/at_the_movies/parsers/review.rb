module AtTheMovies
  module Parsers
    class Review < Parser
      def parse
        AtTheMovies::Review.new
      end
    end
  end
end
