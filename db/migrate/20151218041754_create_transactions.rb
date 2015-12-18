class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :buyer_id

      t.timestamps null: false
    end
  end
end
