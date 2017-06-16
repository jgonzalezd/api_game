FactoryGirl.define do
  factory :valid_word do
    word { Faker::Hipster.word }
  end
end
