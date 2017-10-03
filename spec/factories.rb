FactoryGirl.define do
  factory :user do
    name { FFaker::Name.name }
  end

  factory :question do
    association :asker, factory: :user
    title { FFaker::HipsterIpsum.sentence.gsub(/\.$/, "?") }
  end

end
