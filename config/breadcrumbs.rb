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
  link "支払い方法"
  parent :user
end

crumb :person_registration do
  link "本人情報確認", identification_user_path
  parent :user
end

crumb :profile do
  link "プロフィール", edit_user_path
  parent :user
end

crumb :detail_item do |item|
  link item.name
  parent :root
end