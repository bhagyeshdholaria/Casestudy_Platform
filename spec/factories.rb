FactoryBot.define do
  factory :user, aliases: [:creator] do
    name { 'contentcreator1' }
    email { "#{name}@g.c" }
    password { '111111' }

    after(:create) do |user|
      user.roles << FactoryBot.create(:role)
      # create_list(:casestudy, 5, creator: user)
    end
  end

  factory :role do
    name { 'contentcreator' }
  end

  factory :casestudy do
    sequence(:name) { |n| "casestudy#{n}" }
    duration { Random.new.rand(100..200) }
    scale { Random.new.rand(1..10) }
    creator
  end
end
