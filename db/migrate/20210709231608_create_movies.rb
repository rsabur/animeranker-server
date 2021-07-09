class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :genre
      t.string :image

      t.timestamps
    end
  end
end
