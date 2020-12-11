# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#puts "came insideeeeeeeeeeeeeeeeeeeeee"
ShiftTime.create!(name: "Morning_shift", strat_time: "09:00", end_time: "13:00", restarent_id: 1)
ShiftTime.create!(name: "Evening_shift", strat_time: "18:00", end_time: "23:00", restarent_id: 1)
TableName.create(name: "couple", min_count:2, max_count: 2, restarent_id: 1)
TableName.create(name: "Family", min_count:3, max_count: 5, restarent_id: 1)
TableName.create(name: "Join Family", min_count:6, max_count: 10, restarent_id: 1)