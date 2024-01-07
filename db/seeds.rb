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


class ManualTestData  

  def initialize
    @european_cities = [
    "Paris", "Berlin", "London", "Madrid", "Rome",
    "Athens", "Amsterdam", "Vienna", "Prague", "Lisbon",
    "Barcelona", "Warsaw", "Budapest", "Oslo", "Stockholm",
    "Dublin", "Brussels", "Copenhagen", "Helsinki", "Zurich",
    "Bratislava", "Ljubljana", "Luxembourg", "Reykjavik", "Dubrovnik",
    "Edinburgh", "Geneva", "Munich", "Milan", "Krakow",
    "Venice", "Bucharest", "Belgrade", "Sofia", "Hamburg",
    "Frankfurt", "Cologne", "Marseille", "Barcelona", "Valencia",
    "Seville", "Granada", "Porto", "Florence", "Naples",
    "Turin", "Palermo", "Lyon", "Toulouse", "Bilbao"
    ]
  end

  def rand_date(start_date, end_date)
    date_range = (Date.parse(start_date)..Date.parse(end_date)).to_a
    random_date = date_range[rand(date_range.length)]
    formatted_random_date = random_date.strftime("%d-%m-%Y")
    formatted_random_date
  end

    
  def create_users(n)
    n.times do |i|
      User.create(
        email: "test#{i+1}@test.com",
        password: 'password'
      )
    end
  end


  def create_events(n)
    n.times do |i|
      user = User.order("RANDOM()").first
      user.created_events.create(
        date: rand_date("01-01-2023", "01-01-2026"),
        location: @european_cities[rand(50)]
      )
    end
  end

  def create_invites
    Event.all.order("RANDOM()").limit(7).each do |e|
      e.invite_users(6.times.map {rand(1...10)})
    end
  end

  def invite_creator
    Event.includes(:creator).all.each do |e|
      e.invite_user(e.creator.id)
    end
  end

end

if Rails.env.development?
  seeder = ManualTestData.new
  seeder.create_users(10) 
  seeder.create_events(10) 
  seeder.create_invites
  seeder.invite_creator
end