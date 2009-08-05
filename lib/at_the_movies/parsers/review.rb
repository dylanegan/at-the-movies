module AtTheMovies
  module Parsers
    class Review < Parser
      RATINGS = { 
        "zero" => 0,
        "half" => 0.5,
        "one" => 1,
        "one-and-a-half" => 1.5,
        "two" => 2,
        "two-and-a-half" => 2.5,
        "three" => 3,
        "three-and-a-half" => 3.5,
        "four" => 4,
        "four-and-a-half" => 4.5,
        "five" => 5
      }

      def parse
        return unless @page.body[/Review by/]
        AtTheMovies::Review.new(title, classification, date, duration, genre, ratings, @page.uri.to_s)
      end

      def details
        @details ||= @page.search('p.moviedetails').inner_html.strip
      end

      def title
        @page.title.strip[15..-1]
      end

      def classification
        details.scan(/Classification:<\/strong> ([[:alnum:][:punct:][:space:]]{1,10})<br>/).flatten.first
      end

      def date
        Date.parse(@page.search('meta[@name="Date"]').first['content'].gsub('/', '-'))
      end

      def duration
        details.scan(/Duration:<\/strong> ([0-9]{1,3})/).flatten.first.to_i
      end

      def genre
        details.scan(/Genre:<\/strong> ([[:alnum:][:space:][:punct:]]+)<br><strong>Director:/).flatten.first
      end

      def ratings
        score = @page.search('p.score')
        ratings = score.css('img').collect { |image| image['alt'][0..-7] }
        ratings = score.css('p.score').text.scan(/Margaret|David/).inject_with_index({}) do |hash, person, index|
          hash[person] = RATINGS[ratings[index]]
          hash
        end
        ratings
      end
    end
  end
end
