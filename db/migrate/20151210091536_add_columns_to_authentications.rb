class AddColumnsToAuthentications < ActiveRecord::Migration
  def up
  	add_column :authentications, :uid, :string
  	add_column :authentications, :token, :string
  	add_column :authentications, :provider, :string
  end

  def down
  	remove_column :authentications, :uid
	remove_column :authentications, :token
	remove_column :authentications, :provider
  end

end
