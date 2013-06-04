class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :title
      t.string :description
      t.date :date
      t.string :size
      t.decimal :price
      t.binary :thumbnail

      t.timestamps
    end

    add_index :designs, :author_id
  end
end
