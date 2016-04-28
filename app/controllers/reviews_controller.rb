class ReviewsController < ApplicationController
  before_filter :set_category, :set_game

  def index
    @reviews = @game.reviews

    respond_to do |f|
      f.html
      f.json { render json: {  games: @game, reviews: @reviews } }
    end
  end

  def show
    @review = @game.reviews.find(params[:id])
    render json: {  review: @review}
  end





  def create
    @review = Review.new(Review_params)
    @review.category.game = @game

    if @review.save
      render json: { review:@review, location: review_url(@review)}, status: 201
    else
      render json: { errors: @review.errors }, status:422
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      render json: { review:@review }, status: 202
    else
      render json: { errors:@review.errors }, status:422
    end
  end

def destroy
  @review = Review.find(params[:id])
  if @review.destroy
    render json: { review: nil }
  else
    render json: { errors:@review.errors }
  end
end

  protected
  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_game
    @game = Game.find(params[:game_id])
  end



end
