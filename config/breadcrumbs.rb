crumb :root do
  link "トップページ", root_path
end

crumb :user do
  link "マイページ", user_path(current_user.id)
  parent :root
end

crumb :product do
  product = Product.find_by(params[:id])
  link "商品詳細", product_path(product.id)
  parent :root
end

crumb :new do
  link "クレジットカード登録", new_card_path
  parent :user
end




