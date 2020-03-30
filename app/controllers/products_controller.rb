class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show]
  
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end
  
  def new
    @product = Product.new
    @product.images.new
    @category_parent_array = ["---"]  
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
     render :layout => 'product_exhibition'
  end
  
  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_deliverywayonSeller
    @get_deliverywayonseller = Deliverywayonseller.all
  end

  def get_deliverywayonBuyer
    @get_deliverywayonbuyer = Deliverywayonbuyer.all
  end
  
  def create
    @product = Product.new(product_params)
    categoryId_params
    redirect_to action: 'done'
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :status_id, :brand, :burden_id, :judge,:deliveryway_id, :days_id, :prefecture_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def categoryId_params
    category=params.permit(:category_id)
    @product[:category_id] = category[:category_id]
  end

  def set_product
    @product = Product.find(params[:id])
  end

end

