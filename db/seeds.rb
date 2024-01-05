# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null

10.times do |i|
  User.create(
    email: "test#{i+1}@test.com",
    password: 'password'
  )
end


def rand_date(start_date, end_date)
  date_range = (Date.parse(start_date)..Date.parse(end_date)).to_a
  random_date = date_range[rand(date_range.length)]
  formatted_random_date = random_date.strftime("%d-%m-%Y")
  formatted_random_date
end

date_array = []
10.times do
  date_array << rand_date("01-01-2023", "01-01-2026")
end

10.times do |i|
  user = User.order("RANDOM()").first
  date = date_array.pop
  user.created_events.create(
    date: date,
    location: 'spain'
    )
end

# user_1s_created_event1 = user_1.created_events.first
# user_1s_created_event1.attendees.create(id: user_2.id)