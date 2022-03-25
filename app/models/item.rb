class Item < ApplicationRecord
  has_many :genre_maps, dependent: :destroy, foreign_key: 'item_id'
  has_many :genres, through: :genre_maps
  has_many :cart_items, dependent: :destroy
  has_many :order_details

  validates :name, presence: true
  validates :price, presence: true

  has_one_attached :image

  def save_genres(sent_genres)
    current_genres = self.genres.pluck(:name) unless self.genres.nil?
    old_genres = current_genres - sent_genres
    new_genres = sent_genres - current_genres

    old_genres.each do |old|
      self.genres.delete Genre.find_by(name: old)
    end

    new_genres.each do |new|
      new_genre_map = Genre.find_or_create_by(name: new)
      self.genres << new_genre_map
    end
  end


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def get_tax_include_price
    tax = 10
    add_tax = 1 + tax.to_f / 100
    (self.price.to_f * add_tax).round
  end

end
