# see class, Object-Oriented Scraping for another way to organise the below code.

class Scraper # the scraper class will scrape the data from the website and then parse all the brand names (and their details?) into another class: brand_names folder (and maybe send the names to a separate cigar_info_class?

    def get_page  # changed from initialize as this class will only focus on scraping and sending the data [see phase 1 lesson "collaborating objects lab"] - however may need an argument of page number
        html = URI.open("http://www.cigargeeks.com/cigardb/default.asp?") #search 'brands' of cigars 
        parsed_content = Nokogiri::HTML(html) # this is the HTML (obtained by URI.open) converted into a structure of nested nodes by Nokogiri.
       
        brands_info = parsed_content.css('.bbstable .messagecellbody') # The .css method takes in an argument of the CSS selector I want to retrieve. 
        
        brands = brands_info.css("a")
        puts brands
       
        brands.count #should return '51' as there are 51 items in the array (the first page of the website)- not sure if it will be able to count this before the iterating method below or after? Probably doesn't matter as has a css selector 'a'.

        brands.each do |brand|
            puts brands.text.strip
        end
    end
end

# CSS Selectors:
# brand_name = brands[1].text
# brand_details = parsed_content.css('.bbstable tr') - with each specific heading e.g length[1], color[6] etc, bring .css('td')[#] e.g. [7] = strength
# brand link = brands[1]["href"]
# cigars_info = parsed_content.css('.bbstable tr') #<tr> is CSS for rows (<td> for columns)
# name_of_cigar = cigars_info.css('td')[10].text  #add in a cigar counter?