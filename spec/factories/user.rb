FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user_#{n}@example.com"}
    password "hogehoge"
    password_confirmation "hogehoge"
    role "normal"

    factory :admin do
      sequence(:email){|n| "admin_#{n}@example.com"}
      role "admin"
    end
  end
end
