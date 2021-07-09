class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :genre, :image
end
