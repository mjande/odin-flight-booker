FactoryBot.define do
  factory :passenger do
    name { "MyString" }
    email { "MyString" }
    flight { nil }
    booking { nil }
  end
end
