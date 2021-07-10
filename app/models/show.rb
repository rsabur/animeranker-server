class Show < ApplicationRecord

    url = URI("https://jikan1.p.rapidapi.com/top/anime/1/tv")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = 'f01f93eb50msh9a484ab00d62557p18864ejsned94d26b18dd'
    request["x-rapidapi-host"] = 'jikan1.p.rapidapi.com'

    response = http.request(request)

    binding.pry
    puts response.read_body
end
