class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :firstName
      t.string :lastName
      t.string :address
      t.string :phone
      t.string :email
      t.text :profile

      t.timestamps
    end
  end
end
