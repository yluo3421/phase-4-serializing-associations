class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :length, :description, :poster_url, :category, :discount
  belongs_to :director
  # addded that review serializer and review controller are simplified
  has_many :reviews
end
