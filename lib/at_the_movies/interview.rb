module AtTheMovies
  class Interview
    attr_reader :title, :date, :interviewee, :interviewer, :url

    def initialize(title, date, interviewee, interviewer, url)
      @title = title
      @date = date
      @interviewee = interviewee
      @interviewer = interviewer
      @url = url
    end
  end
end
