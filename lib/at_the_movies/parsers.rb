%w( interview review ).each { |parser| require File.dirname(__FILE__) + "/parsers/#{parser}" }

module AtTheMovies
  module Parsers
    MAP = {
      "review" => Review
    }

    def self.for(url, options = {})
      tries = 0
      begin
        page = WWW::Mechanize.new.get(url)
      rescue => e
        retry if (tries += 1) < (options[:tries] || 5)
        raise AtTheMovies::ParserError,
          "Failed to parse #{url}. #{e.message}"
      end
      begin
        if score = page.search('p[@class="score"]')
          type = "review" if score.text[/Margaret|David/]
        else
          type = page.search('meta[@name="ABC-Author"]').first['content']
        end
      rescue
        type = "n/a"
      end
      return if options[:only] and type != options[:only]
      parser = MAP[type] || raise(ArgumentError, "Couldn't find a Parser class to parse a #{type.inspect} page")
      parser.parse(page)
    end
  end
end
