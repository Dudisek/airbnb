class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :listings, :start, :string
  	change_column :listings, :end, :string
  end
end
