FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "username#{n}"}
    email {|user| "#{user.username}@example.com".downcase}
    password "secret"
    password_confirmation {|user| user.password}
  end
  factory :admin do
    sequence(:username) {|n| "admin#{n}"}
    email {|admin| "#{admin.username}@example.com".downcase}
    password "secret"
    password_confirmation {|admin| admin.password}
  end
end
