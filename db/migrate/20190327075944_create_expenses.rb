class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.integer :user_id
      t.integer :month
      t.string :label
      t.integer :price
      t.integer :group_id

      t.timestamps
    end
  end
end
