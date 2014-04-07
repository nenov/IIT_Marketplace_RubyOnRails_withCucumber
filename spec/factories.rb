FactoryGirl.define do
  factory :user do
    name     "Leo Larrere"
    email    "leolarrere@hotmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end