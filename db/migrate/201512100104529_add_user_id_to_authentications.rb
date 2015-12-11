class AddUserIdToAuthentications < ActiveRecord::Migration


  def up
  	add_column :authentications, :user_id, :integer
  	
  end

  def down
  	remove_column :authentications, :user_id
	
  end
end
