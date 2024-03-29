crumb :root do
  link "メルカリ", root_path
end

crumb :user do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :logout do
  link "ログアウト", users_logout_path
  parent :user
end

crumb :credit do
  link "支払い方法", cards_path
  parent :user
end

crumb :new_credit do
  link "クレジットカード情報入力", new_card_path
  parent :credit
end

crumb :person_registration do
  link "本人情報確認", identification_user_path
  parent :user
end

crumb :profile do
  link "プロフィール", edit_user_path
  parent :user
end

crumb :detail_item do
  item = Item.find_by(id: params[:id])
  link item.name, item_path(item.id)
  parent :root
end

crumb :item_show_page do
  item = Item.first
  link item.name, item_path(item.id), data: {"turbolinks": false}
end

crumb :search_result do |key_word|
  if key_word.present?
    link key_word
    parent :root
  else
    link "検索結果"
  end
end