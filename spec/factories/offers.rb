FactoryGirl.define do
  factory :offer do
    name "MyString"
    description "MyString"
    cost_per_person 1
    max_number_of_people 1
    user nil
  end
end
