FactoryBot.define do
  factory :content do
    text { Faker::Company.bs }
  end
end
