FactoryBot.define do
  factory :trainer do
    name                        {"田中直樹"}
    belonging                   {"愛知ジム"}
    area                        {"愛知県"}
    email                       {"111@com"}
    password                    {"tanaka111"}
    password_confirmation       {password}
  end
end
