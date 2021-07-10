class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.integer :mal_id
      t.integer :rank
      t.string :title
      t.string :url
      t.string :image_url 
      t.string :kind
      t.integer :episodes
      t.string :start_date
      t.string :end_date
      t.integer :members
      t.float :score
      t.timestamps
    end
  end
end
