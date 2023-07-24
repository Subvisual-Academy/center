FactoryBot.define do
  sequence :email do |n|
    "example#{n}@gmail.com"
  end
end

FactoryBot.define do
  factory :user do
    email { generate(:email) }
    password { "123456" }
  end
end
