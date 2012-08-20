FactoryGirl.define do
  factory :user do
    email "test@dreamyourweb.nl"
    password "foobar"
    password_confirmation "foobar"
  end
end