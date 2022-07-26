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
#in IRB the above gives me a very long result but ends with following error relating to my environment:
#  "[...]
# ;\n  ">]>, #<Nokogiri::XML::Text:0x6248 "\n\n">, #<Nokogiri::XML::Element:0x4254 name="script" attributes=[#<Nokogiri::XML::Attr:0x4268 name="src" value="https://cloudfront.fitnessblender.com/assets/bundle/app-c98ec5bf4a06f19c0370.js">]>, #<Nokogiri::XML::Text:0x625c "\n\n">]>, #<Nokogiri::XML::Text:0x6270 "\n">]>]> (NoMethodError)
# 	from /Users/janan/.rvm/rubies/ruby-3.0.1/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
# 	from /Users/janan/.rvm/rubies/ruby-3.0.1/bin/irb:23:in `load'
# 	from /Users/janan/.rvm/rubies/ruby-3.0.1/bin/irb:23:in `<main>
    end
end


# class Scraper

#     lines = {}
#     # def get_data_hash
#         html = URI.open("https://www.fitnessblender.com/"){|f|
#         f.each_line {|line| lines[p line] = {} }
#       } 
#         page = Nokogiri::HTML(html)
        
#    page.css("p")[1].children[0]  #or replace'page' with 'lines' - however doesn't recognise 'children
    
#     binding.pry  
      
# end