# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Genre.destroy_all
User.destroy_all
Video.destroy_all
View.destroy_all

entertainment = Genre.create(name: 'Entertainment')
education = Genre.create(name: 'Education')
comedy = Genre.create(name: 'Comedy')

abhi = User.create(first_name: 'Abhinav', last_name: 'Sharma', country: 'United States', username: 'asharma414', password: 'test123')

vid = Video.create(title: 'test', description: 'test description', user_id: abhi.id, public: true)

vid.clip.attach(io: File.open('/Users/abhi/Development/code/Mod5/mod5-project/utube-backend/public/assets/test.mp4'), filename: 'test.mp4')
