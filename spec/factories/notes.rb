FactoryBot.define do
  factory :note do |f|
    f.association(:content)
  end
end
