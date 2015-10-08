FactoryGirl.define do 
  factory :user do
    name "Ivan Ivanov"
    email "ivanov@mail.ru"
    password "password"
    password_confirmation "password"
  end
end