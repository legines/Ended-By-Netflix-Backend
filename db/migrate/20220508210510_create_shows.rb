class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :title
      t.string :genre
      t.string :subgenre
      t.string :description
      t.string :canceled_description
      t.datetime :premiere
      t.datetime :finale
      t.string :seasons
      t.string :runtime
      t.integer :canceled, null: false
      t.timestamps
    end
  end
end
