class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :title
      t.string :description
      t.date :date
      t.string :size
      t.decimal :price
      t.binary :thumbnail
      t.integer :user_id

      t.timestamps
    end

  end
end
