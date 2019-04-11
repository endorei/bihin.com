# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'endo rei', email: 'endo_rei@kakaku.com', department: '開発部', password: 'hoge')
User.create(name: 'taro', email: 'taro@kakaku.com', password: 'hoge')
User.create(name: 'aaa', email: 'aaa@kakaku.com', password: 'hoge')
User.create(name: 'テスト', email: 'aaa@kakaku.com', password: 'hoge')

(0..8).each do |floor|
  Room.create(name: "#{floor}階 部屋A")
  Room.create(name: "#{floor}階 部屋B")
end

r = Random.new(42)
10.times do
  Fixture.create(name: 'マウス', type_number: 'AAA-XXX1', room: get_random_id(r, Room).id, note: 'テスト')
end
10.times do
  Fixture.create(name: 'キーボード', type_number: "BBB-XXX#{r.rand(5)}", room: get_random_id(r, Room).id)
end

10.times do
  Rental_history.create(user: get_random_id(r, User), fixture: get_random_id(r, Fixture), note: 'aaaaa', returned_at: Time.now.to_s(:db))
end


def get_random_id(r, model)
  s = model.size
  return model.find(r.rand(s) + 1).id
end