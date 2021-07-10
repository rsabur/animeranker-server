class Movie < ApplicationRecord

    def self.scrape_movies 
        html = URI.open("https://thesmartlocal.com/japan/japanese-anime-movies/")
        res = Nokogiri::HTML(html)  

        titles = []
        description = []
        genre = []
        img = []
        
        res.css('div.post-content').each do |x|
            x.css('b').each do |y| 
                titles << y.text
            end

            x.css('img').each do |y|
                img << y.attributes['src'].value
            end

            x.css('p > span').each do |y|
                description << y.text
            end

            x.css('p > span').each do |y|
                genre << y.text
                binding.pry
            end
        end
    end
end
