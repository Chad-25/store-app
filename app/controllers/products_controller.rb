class ProductsController < ApplicationController
  def index
    @products = Product.all.order(name: :asc)

    if params[:search]
      @products = @products.where("name LIKE ?", "%#{params[:search]}%")
    end
  end

  def show
    @product = Product.find_by(id: params[:id])

    if !(@product)
      redirect_to root_path
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy!
    redirect_to root_path

  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity)
  end
end
