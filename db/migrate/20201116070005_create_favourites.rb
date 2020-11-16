class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.references :product, null: false, foreign_key: true
      t.references :buyer, references: :users, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
