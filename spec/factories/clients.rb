FactoryBot.define do
  factory :client do
    image                 {"spec/fixtures/sample.jpg"}
    name                  {"田中隆"}
    age                   {23}
    sex                   {true}
    belonging             {"名古屋ジム"}
    weakness              {Faker::Lorem.sentences}
    purpose               {Faker::Lorem.sentence}
    start_time            {Faker::Date.between(from: '2020-11-25', to: '2021-09-25')}
    session_time          {"13:50:00"}
    remarks               {Faker::Lorem.sentence}
    trainer_id            {trainer.id = 1}
    association :trainer
  end
end
