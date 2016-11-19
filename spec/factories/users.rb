FactoryGirl.define do
  factory :user do
    name "Test User"
    address "Test Address 32/1"
    email
    password "qweasdzxc"

    after(:build) do |user|
      user.skip_confirmation!
    end
  end
end
