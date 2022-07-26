require "nokogiri"
require "open-uri"
require "pry"

class Scraper

    def initialize
        html = URI.open("https://www.airbnb.ca/s/Italy/homes?tab_id=home_tab&flexible_trip_lengths%5B%5D=one_week&search_type=unknown&refinement_paths%5B%5D=%2Fhomes&place_id=ChIJA9KNRIL-1BIRb15jJFz1LOI&date_picker_type=calendar&checkin=2023-02-01&checkout=2023-02-05&adults=2") #list of all airbnbs for 2 guests in Italy from 1 to 5 February 2023
        content = html.read
        parsed_content = Nokogiri::HTML(content)
        # parsed_content.css("a").css(".content-details") this give me an empty array
        # however if i capitalise .CSS it gives me results:
        parsed_content.css("div.dir.dir-ltr").css("div.c4mnd7m.dir.dir-ltr")

binding.pry

    end
end


