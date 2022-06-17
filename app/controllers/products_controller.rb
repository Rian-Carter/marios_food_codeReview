class ProductsController < ApplicationController
  before_action :only => [:new, :edit, :create, :update, :destroy] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def index
      @products = Product.all
      render :index
  end

  def home
    @products = Product.all
    if params[:sort] == "recent"
      @products = Product.recent
    elsif params[:sort] == "most_reviews"
      @products = Product.most_reviews
    else params[:sort] == "usa"
      @products = Product.usa
      render :home
    end
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      flash[:notice] = "Your product was not added."
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to products_path
    else
      flash[:notice] = "Your product was not updated."
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :cost, :origin)
  end
end