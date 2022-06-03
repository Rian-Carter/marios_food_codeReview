class ProductsController < ApplicationController

  def index
    @products = Product.all
    if params[:sort] == "recent"
      @products = Product.recent
    elsif params[:sort] == "most_reviews"
      @products = Product.most_reviews
    elsif params[:sort] == "usa"
      @products = Product.usa
    else
      @products = Product.all
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product added."
      redirect_to products_path
    else
      flash[:notice] = "Product not added."
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product updated."
      redirect_to products_path
    else
      flash[:notice] = "Product not updated."
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