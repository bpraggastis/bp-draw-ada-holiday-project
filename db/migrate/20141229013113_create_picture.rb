class CreatePicture < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :image
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
