class ReviewsController < ApplicationController
  before_action :find_restaurant, only: %i[ create ]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # Not an optional step. MUST do this. This ensures that the restaurant id is associated to the review
    @review.restaurant = @restaurant
    # If the user saves a review with content, then redirect them to the restaurant page
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # this render is handled with simple forms. So, if the user tries to pass blank content, we render the form 'new' and it will display an error (the errors are thanks to the review validations!!!)
      render :new
    end
  end
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end
  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])

  end

  def review_params
    params.require(:review).permit(:content)
  end
end
