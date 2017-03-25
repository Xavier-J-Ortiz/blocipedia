# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


5.times do
  User.create!(
      email: Faker::Internet.email,
      password: "1234567",
      password_confirmation: "1234567",
      confirmed_at: Time.now
  )
end

users = User.all
55.times do
  Wiki.create!(
      title: Faker::Hipster.sentence(3),
      body: Faker::Hipster.paragraphs(3).join(' '),
      user_id: users.sample.id,
      private: false

  )
end
