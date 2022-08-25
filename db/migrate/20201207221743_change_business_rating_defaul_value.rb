class ChangeBusinessRatingDefaulValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default :businesses, :rating, from: nil, to: 0
  end
end
