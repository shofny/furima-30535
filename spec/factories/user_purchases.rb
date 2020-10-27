FactoryBot.define do
  factory :user_purchase do
      token { "tok_abcdefghijk00000000000000000" }
      postal_code { '612-0214' }
      prefecuture_id { Faker::Number.between(from: 2, to: 48) }
      city { '愛知県' }
      address { '名古屋市北区' }
      build_name { '名古屋マンション' }
      tel { 1234567890 }
    end
    
  end
