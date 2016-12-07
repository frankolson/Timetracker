FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "My Project #{n}" }
    client "MyString"
    archived false
  end
end
