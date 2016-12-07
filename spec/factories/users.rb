FactoryGirl.define do
  factory :user do
    name 'Will'
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password 'pw'
  end
end
