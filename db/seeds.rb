# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def get_random_record(r, model)
  return model.find(r.rand(model.count) + 1)
end

User.create(name: 'endo rei', employee_id: 'xxx', email: 'endo_rei@kakaku.com', department: '開発部', password: 'hoge', power: 1)
User.create(name: 'taro', employee_id: 'yyy', email: 'taro@kakaku.com', password: 'hoge', power: 1)
User.create(name: 'テスト', employee_id: 'zzz', email: 'tes@kakaku.com', password: 'hoge', power: 1)
User.create(name: 'aaa', employee_id: '111', email: 'aaa@kakaku.com', password: 'hoge', power: 0)
User.create(name: 'bbb', employee_id: '222', email: 'bbb@kakaku.com', password: 'hoge')

(1..7).each do |floor|
  Room.create(name: "#{floor}階 部屋A")
  Room.create(name: "#{floor}階 部屋B")
end

r = Random.new(42)
10.times do
  Fixture.create(name: 'マウス', type_number: 'AAA-XXX1', room: get_random_record(r, Room), note: 'テスト')
end
10.times do
  Fixture.create(name: 'キーボード', type_number: "BBB-XXX#{r.rand(5)}", room: get_random_record(r, Room))
end

10.times do
  RentalHistory.create(user: get_random_record(r, User), fixture: get_random_record(r, Fixture),
    note: 'aaaaa', returned_at: Time.now.to_s(:db), expected_return_at: (Time.now + r.rand(10).days).to_s(:db))
  
  RentalHistory.create(user: get_random_record(r, User), fixture: get_random_record(r, Fixture),
    note: 'bbbbb', returned_at: (Time.now + r.rand(20).days).to_s(:db), expected_return_at: (Time.now + r.rand(20).days).to_s(:db))
    
  RentalHistory.create(user: get_random_record(r, User), fixture: get_random_record(r, Fixture),
    note: 'ccccc', expected_return_at: (Time.now + r.rand(30).days).to_s(:db))
end

