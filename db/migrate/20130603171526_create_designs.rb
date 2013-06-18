class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :title
      t.string :description
      t.date :date
      t.string :size
      t.decimal :price
      t.integer :user_id
	  t.string :image

      t.timestamps
    end

    add_index :designs, :title
    add_index :designs, :user_id
  end
end
