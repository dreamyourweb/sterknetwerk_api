# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :result do
    email "bram@test.nl"
    contact_name "MyString"
    company_name "kip"
    cc "MyString"
    bcc "MyString"
    factory :result_kosten do
      # result_with_answers will create answers data after the result has been created
      # posts_count is declared as an ignored attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      ignore do
        answers_count 1
      end

      # the after(:create) yields two values; the result instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the result is associated properly to the answer
      after(:create) do |result, evaluator|
          FactoryGirl.create_list(:answer_kosten, evaluator.answers_count, result: result)
          FactoryGirl.create_list(:answer_kosten_SN, evaluator.answers_count, result: result)
      end
    end
    factory :result_beveiliging do
      # result_with_answers will create answers data after the result has been created
      # posts_count is declared as an ignored attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      ignore do
        answers_count 1
      end

      # the after(:create) yields two values; the result instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the result is associated properly to the answer
      after(:create) do |result, evaluator|
          FactoryGirl.create_list(:answer_beveilging, evaluator.answers_count, result: result)
      end
    end
    
  end
end
