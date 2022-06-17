class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:new]
  before_action :only => [:edit, :update, :destroy] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end
  
  def show
    @review = Review.find(params[:id])
    @product = @review.product
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to product_path(@review.product)
    else
      flash[:notice] = "Your product was not added."
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated!"
      redirect_to product_review_path(@product, @review)
    else
      flash[:notice] = "Your product was not added."
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end

private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end
end