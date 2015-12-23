class ChangeBookingsDateToString < ActiveRecord::Migration
  def change
  	change_column :bookings, :check_in, :string
  	change_column :bookings, :check_out, :string
  end
end
