FactoryBot.define do
  factory :sns_credential do
    provider { "MyString" }
    uid { "MyString" }
    user { nil }
    address { nil }
  end
end
