
FactoryGirl.define do
  factory :type, :class => Refinery::Events::Type do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

