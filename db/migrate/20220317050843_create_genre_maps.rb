class CreateGenreMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_maps do |t|
      t.references :item, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
