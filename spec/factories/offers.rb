FactoryGirl.define do
  factory :offer do
    sequence(:name) { |n| "Obiad ##{n}" }
    description "Opis obiadu"
    cost_per_person 10
    max_number_of_people 4
    association :user
  end
end
