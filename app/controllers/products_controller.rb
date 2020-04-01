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
      # alert(必須事項はすべて入力してください)
      # @product
      # render :new
    end
  end
  
  def show
    @num = @product.deliveryway_id
    if @num < 11
      @deliveryway = Deliverywayonseller.find(@num)
    else
      @deliveryway = Deliverywayonbuyer.find(@num)
    end
  end
  
  def edit
    # 親セレクトボックスの初期値(配列)
    @category_parent_array = []
    # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    # itemに紐づいていいる孫カテゴリーの親である子カテゴリが属している子カテゴリーの一覧を配列で取得
    @category_child_array = @product.category.parent.parent.children

    # itemに紐づいていいる孫カテゴリーが属している孫カテゴリーの一覧を配列で取得
    @category_grandchild_array = @product.category.parent.children

    @num = @product.deliveryway_id
    if @num < 11
      @deliveryway = Deliverywayonseller.all
    else
      @deliveryway = Deliverywayonbuyer.all
        end

    @times = @image.length
    @num =0
  end

  def get_deliverywayonSeller
    @get_deliverywayonseller = Deliverywayonseller.all
  end

  def get_deliverywayonBuyer
    @get_deliverywayonbuyer = Deliverywayonbuyer.all
  end


  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params) 
      redirect_to root_path
    else
      redirect_to edit_product_path
      # render :edit

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
    params.require(:product).permit(:name, :price, :description, :status_id, :brand, :burden_id, :deliveryway_id, :days_id, :prefecture_id, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def categoryId_params
    category=params.permit(:category_id)
    @product[:category_id] = category[:category_id]
  end

  def set_product
    @product = Product.find(params[:id])
    @image = Image.where(product_id: params[:id])
  end

end