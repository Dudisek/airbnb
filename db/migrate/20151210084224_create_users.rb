class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :birthday
      t.string :phone
      t.text :about
      t.string :picture

      t.timestamps null: false
    end
  end
end




