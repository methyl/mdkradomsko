
FactoryGirl.define do
  factory :event, :class => Refinery::Events::Event do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

