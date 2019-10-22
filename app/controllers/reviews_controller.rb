class ReviewsController < ApplicationController


  def index
    @reviews = Review.all
    @recipes = Recipe.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @recipes = Recipe.all
  end

 

  def create
    @review = Review.new(review_params)

  if @review.valid?
      @review.save 
      # buybug
      redirect_to review_path(@review) 
  else 
      flash[:errors] = @review.errors.full_messages
      redirect_to new_review_path
  end 
  end
  
  def edit
    @review = Review.find(params[:id])
    @recipes = Recipe.all
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy 
    @review = Review.find(params[:id])
    @review.destroy 
    redirect_to reviews_path
  end 
  
    private
  
  def review_params
      params.require(:review).permit(:rating, :comment, :user_id, :recipe_id)
  end 
end
