FactoryGirl.define do
  factory :question do
    title "John"
    indicator
    aspect
    factory :question_kosten do
      factor 50000
      answer_type "number"
      association :aspect, factory: :aspect_kosten 
      cash_sterknetwerk false
    end
    factory :question_kosten_SN do
      factor 50000
      answer_type "number"
      association :aspect, factory: :aspect_kosten
      cash_sterknetwerk true
    end
  end
end