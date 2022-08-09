require "nokogiri"
require "open-uri"
require "pry"

class Scraper # the scraper class will scrape the data from the website and then parse all the brand names (and their details?) into another class: brand_names folder (and maybe send the names to a separate cigar_info_class?

    def initialize  #or change from initialize to: def brand_from_url as this class will only focus on scraping and sending the data/not using the data? [see phase 1 lesson "collaborating objects lab"] - however may need an argument of page number
        html = URI.open("http://www.cigargeeks.com/cigardb/default.asp?") #search 'brands' of cigars instead of reviews
        parsed_content = Nokogiri::HTML(content)
        brands_info = parsed_content.css('.bbstable .messagecellbody') 
        cigars_info = parsed_content.css('.bbstable tr')
        name_of_cigar = cigars_info.css('td')[10].text
        brand_of_cigar = brands_info.css('a')[1].text
        #link_to_cigar = html + brands_info.css('a')[1]['href']
        binding.pry
        

        


    end
end

# For Brands pages:
# brand_name = parsed_content.css('a').text
# brand_details = parsed_content.css('.bbstable tr') - with each specific heading e.g length[1], color[6] etc, bring .css('td')[#] e.g. [7] = strength
# link = html + parsed_content.css('a .href')



# For Reviews pages:
# ("http://www.cigargeeks.com/reviews/default.asp?action=showsearch") #or ("http://www.cigargeeks.com/reviews/default.asp")#list of all reviews of different cigar brands
        # parsed_content.css('td .messagecellbody').css('img')[6].values    #the array number and the format (values) can change
        # parsed_content.css('.bbstable td').css('img')[6]             # same as above
        # parsed_content.css('td .messagecellbody').css('img')         # this gives the star ratings - but in 'values' not 'text'
        # parsed_content.css('.bbstable td')[6]                      # working from 1 to 6 shows the Cigar rating given by individual cigar geek members against a specific cigar.
        # parsed_content.css('.messagecellbody').css('td')[2].text   # gives same results as above
        # parsed_content.css('td .messagecellbody')[2].text          # and this