FactoryBot.define do
  factory :product do
    name { "Rango muito bom" }
    description { "O rango mais maravilhoso de todos" }
    price { 20.0 }
    category { nil }
  end
end
