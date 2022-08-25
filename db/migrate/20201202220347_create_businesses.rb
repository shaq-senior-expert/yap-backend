class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :state
      t.integer :zip
      t.integer :contact
      t.string :website
      t.float :rating
      t.integer :price

      t.timestamps
    end
  end
end
