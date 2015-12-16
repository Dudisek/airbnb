class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.integer :guests	
	  t.references :user, index: true, foreign_key: true   
	  t.references :listing, index: true, foreign_key: true 	
      t.timestamps null: false
    end
  end
end
