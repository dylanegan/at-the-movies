module AtTheMovies
  class ParserError < StandardError; end
  class Parser
    attr_reader :page

    def self.parse(page)
      parser = new(page)
      parser.parse
    end

    def initialize(page)
      @page = page
    end

    def parse
      raise NotImplementedError, "where am I?"
    end
  end
end
