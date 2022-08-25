class Review < ApplicationRecord
  default_scope { order rating: :asc }
  validates_presence_of :rating
  belongs_to :user
  belongs_to :business
  after_create :change_rating
  before_destroy :delete_rating
  around_update :update_rating
  validates :rating, numericality: { less_than_or_equal_to: 5 }

  private

  def change_rating
    current_rating = Business.find_by_id(self.business_id).rating
    total_reviews = Review.where("business_id = #{self.business_id}").size
    total = current_rating * (total_reviews - 1)
    updated_rating = (total + self.rating) / total_reviews
    Business.find_by_id(self.business_id).update(rating: updated_rating)
  end

  def delete_rating
    current_rating = Business.find_by_id(self.business_id).rating
    total_reviews = Review.where("business_id = #{self.business_id}").size
    total = current_rating * total_reviews
    updated_rating = (total - self.rating) / (total_reviews - 1)
    # binding.pry
    if updated_rating > 0
      Business.find_by_id(self.business_id).update(rating: updated_rating)
    else
      Business.find_by_id(self.business_id).update(rating: 0)
    end
  end

  def update_rating
    current_rating = Business.find_by_id(self.business_id).rating
    total_reviews = Review.where("business_id = #{self.business_id}").size
    total = current_rating * total_reviews
    newTotal = total - self.rating_was
    # binding.pry
    yield
    newTotal += self.rating
    updated_rating = newTotal / total_reviews
    # binding.pry
    Business.find_by_id(self.business_id).update(rating: updated_rating)
  end
end
