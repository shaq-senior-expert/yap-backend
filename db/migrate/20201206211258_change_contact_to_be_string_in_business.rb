class ChangeContactToBeStringInBusiness < ActiveRecord::Migration[6.0]
  def up
    change_column :businesses, :contact, :string
  end

  def down
    change_column :businesses, :contact, :integer
  end
end
