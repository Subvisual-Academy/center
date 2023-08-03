FactoryBot.define do
  sequence :email do |n|
    "example#{n}@gmail.com"
  end
end

FactoryBot.define do
  company = FactoryBot.create(:company)
  factory :user do
    email { generate(:email) }
    password { "123456" }
    company_id { company.id }
  end
end
