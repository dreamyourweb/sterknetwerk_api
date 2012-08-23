# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    result
    question
    value 5
    factory :answer_kosten do
      association :question, factory: :question_kosten
    end
    factory :answer_kosten_SN do
      association :question, factory: :question_kosten_SN
    end
  end
end
