class Products::SearchesController < ApplicationController
  def index
    @search_results = Product.search(params[:keyword])
    @products = Product.where(judge: "出品中").order('created_at DESC').limit(3)
    @ladies_products = Product.where(judge: "sold").order('created_at DESC').limit(3)
    @images = Image.all
    render 'products/index'
  end
end
