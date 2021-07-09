class ShowSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :genre, :image
end
