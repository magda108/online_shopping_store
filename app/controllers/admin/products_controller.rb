class Admin::ProductsController < Admin::AdminController
  def index
    @products = Product.order(:name)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      redirect_to products_path
    else
      redirect_to products_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_code, :name, :price, :discount)
  end
end
