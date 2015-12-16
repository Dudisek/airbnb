class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :body
      t.date :start
      t.date :end
      t.integer :price
      t.integer :num_of_guest
      t.string :room_type
      t.json :picture
      t.address :address

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end