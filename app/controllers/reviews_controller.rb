class ReviewsController < ApplicationController
  before_action :set_restaurant

  def new
    # We need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # Render the 'show' view again with the form and validation errors
      render 'restaurants/show'
    end
  end


  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
