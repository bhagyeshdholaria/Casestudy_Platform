# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create([{ name: 'candidate' }, { name: 'assessor' }, { name: 'contentcreator' }])

1.upto(5) do |i|
  User.create(name: "candidate#{i}", email: "candidate#{i}@g.c", password: '111111', password_confirmation: '111111')
end
1.upto(5) do |i|
  User.create(name: "assessor#{i}", email: "assessor#{i}@g.c", password: '111111', password_confirmation: '111111')
end
1.upto(5) do |i|
  User.create(name: "contentcreator#{i}", email: "contentcreator#{i}@g.c", password: '111111', password_confirmation: '111111')
end

1.upto(5) do |j|
  RoleUser.create(role_id: 1, user_id: j)
end
6.upto(10) do |j|
  RoleUser.create(role_id: 2, user_id: j)
end
11.upto(15) do |j|
  RoleUser.create(role_id: 3, user_id: j)
end

Casestudy.create([{ name: 'CS_1', creator_id: 11, duration: 111, scale: 11 },
                  { name: 'CS_2', creator_id: 11, duration: 122, scale: 12 },
                  { name: 'CS_3', creator_id: 11, duration: 133, scale: 13 },
                  { name: 'CS_4', creator_id: 12, duration: 144, scale: 14 },
                  { name: 'CS_5', creator_id: 12, duration: 155, scale: 15 },
                  { name: 'CS_6', creator_id: 13, duration: 166, scale: 16 }])

Question.create([{ body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vitae ipsum orci. Vestibulum vulputate quis sapien sit amet eleifend. Sed non ornare magna. Praesent eleifend nunc metus, vitae pretium leo.', casestudy_id: 1 },
                 { body: 'Suspendisse at malesuada neque, id lacinia arcu. Phasellus sagittis velit vel condimentum sollicitudin. Curabitur vestibulum, nunc at feugiat fermentum, tellus nulla accumsan justo, id condimentum orci ipsum ut lorem. Donec.', casestudy_id: 1 },
                 { body: 'Vivamus eu sapien magna. Nunc sit amet nulla vel orci mattis feugiat. Suspendisse viverra ipsum a purus pellentesque posuere. Cras rhoncus eget tortor id cursus. In volutpat massa nec tellus.', casestudy_id: 1 },
                 { body: 'Nam sodales leo tortor, id vulputate dolor mattis nec. Curabitur ac odio at lacus imperdiet mollis. Sed eu ultrices felis, ut euismod felis. Vivamus justo neque, pulvinar cursus dui ut.', casestudy_id: 2 },
                 { body: 'Quisque ac turpis convallis, tristique sem et, placerat orci. Vivamus velit lacus, cursus ac est ut, ultrices aliquet augue. Ut eget porttitor est. Pellentesque nunc ipsum, euismod ac egestas ac.', casestudy_id: 2 },
                 { body: 'Praesent luctus eleifend neque. Mauris risus risus, vehicula rutrum sagittis ornare, rutrum a libero. Nunc et pulvinar justo. Donec varius tempor orci, aliquam sollicitudin urna sagittis in. Aenean ut enim.', casestudy_id: 2 },
                 { body: 'Vivamus eu sapien magna. Nunc sit amet nulla vel orci mattis feugiat. Suspendisse viverra ipsum a purus pellentesque posuere. Cras rhoncus eget tortor id cursus. In volutpat massa nec tellus.', casestudy_id: 3 },
                 { body: 'Nam sodales leo tortor, id vulputate dolor mattis nec. Curabitur ac odio at lacus imperdiet mollis. Sed eu ultrices felis, ut euismod felis. Vivamus justo neque, pulvinar cursus dui ut.', casestudy_id: 3 },
                 { body: 'Praesent luctus eleifend neque. Mauris risus risus, vehicula rutrum sagittis ornare, rutrum a libero. Nunc et pulvinar justo. Donec varius tempor orci, aliquam sollicitudin urna sagittis in. Aenean ut enim.', casestudy_id: 4 },
                 { body: 'Suspendisse at malesuada neque, id lacinia arcu. Phasellus sagittis velit vel condimentum sollicitudin. Curabitur vestibulum, nunc at feugiat fermentum, tellus nulla accumsan justo, id condimentum orci ipsum ut lorem. Donec.', casestudy_id: 4 },
                 { body: 'Quisque ac turpis convallis, tristique sem et, placerat orci. Vivamus velit lacus, cursus ac est ut, ultrices aliquet augue. Ut eget porttitor est. Pellentesque nunc ipsum, euismod ac egestas ac.', casestudy_id: 5 },
                 { body: 'Suspendisse at malesuada neque, id lacinia arcu. Phasellus sagittis velit vel condimentum sollicitudin. Curabitur vestibulum, nunc at feugiat fermentum, tellus nulla accumsan justo, id condimentum orci ipsum ut lorem. Donec.', casestudy_id: 5 },
                 { body: 'Vivamus eu sapien magna. Nunc sit amet nulla vel orci mattis feugiat. Suspendisse viverra ipsum a purus pellentesque posuere. Cras rhoncus eget tortor id cursus. In volutpat massa nec tellus.', casestudy_id: 5 },
                 { body: 'Nam sodales leo tortor, id vulputate dolor mattis nec. Curabitur ac odio at lacus imperdiet mollis. Sed eu ultrices felis, ut euismod felis. Vivamus justo neque, pulvinar cursus dui ut.', casestudy_id: 6 }])

CasestudyUser.create([{casestudy_id: 1, user_id: 1, assessor_id: 6 },
                      {casestudy_id: 3, user_id: 1, assessor_id: 7 },
                      {casestudy_id: 5, user_id: 1, assessor_id: 7 },
                      {casestudy_id: 2, user_id: 2, assessor_id: 6 },
                      {casestudy_id: 4, user_id: 2, assessor_id: 8 },
                      {casestudy_id: 6, user_id: 2, assessor_id: 7 },
                      {casestudy_id: 1, user_id: 3, assessor_id: 6 },
                      {casestudy_id: 5, user_id: 3, assessor_id: 8 },
                      {casestudy_id: 2, user_id: 4, assessor_id: 9 },
                      {casestudy_id: 6, user_id: 4, assessor_id: 6 },
                      {casestudy_id: 4, user_id: 5, assessor_id: 9 }])
