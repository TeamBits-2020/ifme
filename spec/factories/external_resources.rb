FactoryBot.define do
  factory :external_resource do
    name { 'Test resource name' }
    link { 'www.resourcelink.com' }
    tags { ['tag_test1', 'tag_test2'] }
    languages { ['en', 'pt-BR'] }
    published { false }
  end
end
