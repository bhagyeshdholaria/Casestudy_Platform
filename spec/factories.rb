FactoryBot.define do
  factory :user, aliases: [:creator] do
    sequence(:name) { |n| "contentcreator#{n}" }
    email { "#{name}@g.c" }
    password { '111111' }

    after(:create) do |user|
      # user.roles << FactoryBot.create(:role) unless user.roles.exists?(name: 'contentcreator')
      user.roles << Role.find_or_create_by(name: 'contentcreator')
    end
  end

  factory :assessor, class: 'User' do
    name { 'assessor1' }
    email { "#{name}@g.c" }
    password { '111111' }

    after(:create) do |user|
      # user.roles << FactoryBot.create(:role, name: 'assessor')
      user.roles << Role.find_or_create_by(name: 'assessor')

    end
  end

  factory :candidate, class: 'User' do
    name { 'candidate1' }
    email { "#{name}@g.c" }
    password { '111111' }

    after(:create) do |user|
      # user.roles << FactoryBot.create(:role, name: 'candidate')
      user.roles << Role.find_or_create_by(name: 'candidate')

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

    after(:create) do |casestudy|
      casestudy.pages << FactoryBot.create_list(:page, 4, casestudy: casestudy)
      casestudy.questions << FactoryBot.create_list(:question, 4, casestudy: casestudy)
    end
  end

  factory :page do
    sequence(:body) { |n| "Page Body #{n}" }
    casestudy
  end

  factory :question do
    sequence(:body) { |n| "Question Body #{n}" }
    casestudy
  end

  factory :trait do
    sequence(:name) { |n| "trait #{n}" }
  end

  factory :casestudy_user do
    user
    casestudy
    assessor
    status { 'pending' }
  end
end
