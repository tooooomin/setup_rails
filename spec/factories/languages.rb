FactoryBot.define do
  factory :language do
    language { Faker::Language.code }
  end
end
