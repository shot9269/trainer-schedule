FactoryBot.define do
  factory :plan_detail do
    subject         {"上半身メニュー"}
    weight          {30}
    set             {5}
    rep             {10}
    cardio          {"ランニング"}
    cardio_time     {30}  
    plan_id         {plan.id = 1}
    association :plan
  end
end
