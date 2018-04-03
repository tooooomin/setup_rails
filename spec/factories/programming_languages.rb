FactoryBot.define do
  factory :programming_language do
    programming_language { Faker::ProgrammingLanguage.name }
  end
end
