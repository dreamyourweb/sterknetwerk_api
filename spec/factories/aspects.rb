# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :aspect do
    title "Mogelijkheden"
    factory :aspect_kosten do
      title "kosten"
      answer_type "cash"
    end
    factory :aspect_beveiliging do
      title "beveiliging"
    end
  end
end
