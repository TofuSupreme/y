class ReviewsController < ApplicationController
  before_action :find_restaurant

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # Not an optional step. MUST do this. This ensures that the restaurant id is associated to the review
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])

  end

  def review_params
    params.require(:review).permit(:content)
  end
end
