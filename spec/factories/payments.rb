FactoryGirl.define do
  factory :payment do
    association :user
    association :offer
    amount 10
    status "complete"
  end
end
