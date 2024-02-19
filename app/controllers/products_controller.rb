class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order(name: :asc)

    if params[:search]
      @products = @products.where("lower(name) LIKE ?", "%#{params[:search].downcase}%")
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.photo = params[:product][:photo] if params[:product][:photo].present?

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.destroy!
    redirect_to root_path

  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description, :photo)
  end

  def find_product
    @product = Product.find_by(id: params[:id])

    redirect_to root_path if !@product
  end
end
