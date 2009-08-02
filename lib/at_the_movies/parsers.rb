%w( review ).each { |parser| require File.dirname(__FILE__) + "/parsers/#{parser}" }

module AtTheMovies
  module Parsers
    MAP = {
      "review" => Review
    }

    def self.for(url, options = {})
      page = WWW::Mechanize.new.get(url)
      type = page.search('meta[@name="ABC-Author"]').first['content']
      return if options[:only] and type != options[:only]
      parser = MAP[type] || raise(ArgumentError, "Couldn't find a Parser class to parse a #{type.inspect} page")
      parser.parse(page)
    end
  end
end
