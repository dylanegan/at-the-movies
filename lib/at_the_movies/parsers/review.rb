module AtTheMovies
  module Parsers
    class Review < Parser
      def parse
        return unless @page.body[/Review by/]
        AtTheMovies::Review.new(title, classification, date, duration, genre, ratings)
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
          hash[person] = ratings[index]
          hash
        end
        ratings
      end
    end
  end
end
