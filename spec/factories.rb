FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "username#{n}"}
    email {|user| "#{user.username}@example.com".downcase}
    password "secret"
    password_confirmation {|user| user.password}
  end
end
