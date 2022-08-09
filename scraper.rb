require "nokogiri"
require "open-uri"
require "pry"

class Scraper

    def initialize  #or change fro initialize to: def brand_from_url - however may need an argument of page number
        html = URI.open("http://www.cigargeeks.com/cigardb/default.asp?") #search 'brands' of cigars instead of reviews
        parsed_content = Nokogiri::HTML(content)
        cigar_brands = parsed_content.css('.bbstable .messagecellbody') 

        
        binding.pry
        

        


    end
end


# For Review pages:
# ("http://www.cigargeeks.com/reviews/default.asp?action=showsearch") #or ("http://www.cigargeeks.com/reviews/default.asp")#list of all reviews of different cigar brands
        # parsed_content.css('td .messagecellbody').css('img')[6].values    #the array number and the format (values) can change
        # parsed_content.css('.bbstable td').css('img')[6]             # same as above
        # parsed_content.css('td .messagecellbody').css('img')         # this gives the star ratings - but in 'values' not 'text'
        # parsed_content.css('.bbstable td')[6]                      # working from 1 to 6 shows the Cigar rating given by individual cigar geek members against a specific cigar.
        # parsed_content.css('.messagecellbody').css('td')[2].text   # gives same results as above
        # parsed_content.css('td .messagecellbody')[2].text          # and this