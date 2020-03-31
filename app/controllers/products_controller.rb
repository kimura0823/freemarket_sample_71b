class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show]
  
  def index
    @products = Product.where(judge: "出品中").order('created_at DESC').limit(3)
    @images = Image.all
  end
  
  def new
    @product = Product.new
    @product.images.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
     render :layout => 'product'
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
    if @product.save
      
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end
  
  def show
    @image = Image.where(product_id: params[:id])
    @test = @product.deliveryway_id
    if @test < 11
      @deliveryway = Deliverywayonseller.find(@test)
    else
      @deliveryway = Deliverywayonbuyer.find(@test)
    end
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
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :status_id, :brand, :burden_id, :deliveryway_id, :days_id, :prefecture_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def categoryId_params
    category=params.permit(:category_id)
    @product[:category_id] = category[:category_id]
  end

  def set_product
    @product = Product.find(params[:id])
  end

end