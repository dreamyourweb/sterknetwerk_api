# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :result, :class => 'Results' do
    email "MyString"
    name "MyString"
    cc "MyString"
    string "MyString"
    bcc "MyString"
  end
end
