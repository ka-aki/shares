class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :password_digest
      t.string :image_name

      t.timestamps
    end
  end
end
