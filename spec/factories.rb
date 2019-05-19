FactoryBot.define do
  factory :lease do
    address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    country { "MyString" }
    rent { 1.5 }
    start_date { "2019-05-17" }
    end_date { "2019-05-17" }
    due_date { 1 }
  end

  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    email { "john@doe.com" }
  end
end
