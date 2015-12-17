# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# SEED USERS
10.times do
User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, birthday: Faker::Time.between(DateTime.now - 1, DateTime.now), password: "123456", about: Faker::Lorem.paragraph )
end

# SEED LISTING
10.times do
Listing.create(name: Faker::Book.title, body: Faker::Lorem.paragraph, 
				start: Faker::Time.between(DateTime.now - 1, DateTime.now),
				end: Faker::Time.between(DateTime.now - 1, DateTime.now),
				price: Faker::Number.between(1, 10),
				room_type: Faker::Company.suffix,
				user_id: Faker::Number.between(1, 10),
				created_at: Faker::Time.between(DateTime.now - 1000, DateTime.now))
end

# SEED ANSWER
# 300.times do
# Answer.create(comment: Faker::Lorem.paragraph, user_id: Faker::Number.between(1, 200), created_at: Faker::Time.between(DateTime.now - 1000, DateTime.now), question_id: Faker::Number.between(1, 100))
# end

# # SEED QVOTES
# 300.times do
# Qvote.create(upvote: Faker::Number.between(0, 1), downvote: Faker::Number.between(0, 1), question_id: Faker::Number.between(1, 100), user_id: Faker::Number.between(1, 200))
# end

# # SEED AVOTES
# 300.times do
# Avote.create(upvote: Faker::Number.between(0, 1), downvote: Faker::Number.between(0, 1), answer_id: Faker::Number.between(1, 100))
# end