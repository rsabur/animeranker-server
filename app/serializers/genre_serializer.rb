class GenreSerializer
  include FastJsonapi::ObjectSerializer
  attributes :mal_id, :rank, :title, :url, :image_url, :type, :episodes, :start_date, :end_date, :members, :score
end
