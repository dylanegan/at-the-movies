module AtTheMovies
  module Parsers
    class Interview < Parser
      def parse
        interviewer, interviewee = details
        if interviewer && interviewee
          AtTheMovies::Interview.new(title, date, interviewee, interviewer, @page.uri.to_s)
        end
      end

      def details
        @page.body.scan(/(Margaret|David) interviews (.*).<\/p>\r/).flatten
      end

      def title
        @page.title.strip[15..-1]
      end

      def date
        Date.parse(@page.search('meta[@name="Date"]').first['content'].gsub('/', '-'))
      end
    end
  end
end
