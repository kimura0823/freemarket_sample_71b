class PurchaseController < ApplicationController

  require 'payjp'

  def index
    @product = Product.find_by(params[:id])
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = "sk_test_03c7ba6d1b907829f8fb944e"
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @product = Product.find_by(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = "sk_test_03c7ba6d1b907829f8fb944e"
    Payjp::Charge.create(
    amount: @product.price,
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end

  def done
    if@product = Product.find_by(params[:id])
    @product.update(judge:"sold")
    @product.save validate: false
    else
      redirect_to action: 'done'
    end
  end
  

  private

  def product_params
    params.require(:product).permit(
      :name,
      :text,
      :price,
      :judge,
      #この辺の他コードは関係ない部分なので省略してます
    ).merge(user_id: current_user.id)
  end

end