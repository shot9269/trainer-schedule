FactoryBot.define do
  factory :plan do
    title         {"足の筋トレ"}
    description    {Faker::Lorem.sentences}
    caution       {Faker::Lorem.sentence}
    client_id       {client.id = 1}
    association :client
  end
end
