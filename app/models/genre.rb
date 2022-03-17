class Genre < ApplicationRecord
  has_many :genre_maps, dependent: :destroy, foreign_key: 'genre_id'
  has_many :items, through: :genre_maps

end
