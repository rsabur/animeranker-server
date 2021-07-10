class Genre < ApplicationRecord
    def self.api
        url = URI("https://jikan1.p.rapidapi.com/top/anime/1/tv")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = 'f01f93eb50msh9a484ab00d62557p18864ejsned94d26b18dd'
        request["x-rapidapi-host"] = 'jikan1.p.rapidapi.com'

        response = http.request(request)
        

        data = JSON.parse(response.body)


        data['top'].each do |x|
            mal_id = x['mal_id']
            rank = x['rank']
            title = x['title']
            url = x['url']
            image = x['image_url']
            kind = x['type'] 
            episodes = x['episodes']
            start_date = x['start_date']
            end_date = x['end_date']
            members = x['members'] 
            score = x['score'] 
            g = Genre.new(mal_id: mal_id, rank: rank, title: title, url: url, image_url: image, kind:  kind, episodes: episodes, start_date: start_date, end_date: end_date, members: members, score: score)
            g.save
        end
    end
end
