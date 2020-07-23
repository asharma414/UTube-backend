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
Subscription.destroy_all

entertainment = Genre.create(name: 'Entertainment')
education = Genre.create(name: 'Education')
film = Genre.create(name: "Film & Animation")
auto = Genre.create(name: "Music")
pets = Genre.create(name: "Pets & Animals")
sports = Genre.create(name: "Sport")
travel = Genre.create(name: "Travel & Events")
gaming = Genre.create(name: "Gaming")
people = Genre.create(name: "People & Blogs")
music = Genre.create(name: "Music")
news = Genre.create(name: "News & Politics")
howto = Genre.create(name: "Howto & Style")
science = Genre.create(name: "Science & Technology")
nonprofit = Genre.create(name: "Nonprofits & Activism")
comedy = Genre.create(name: 'Comedy')

abhi = User.create(first_name: 'Abhinav', last_name: 'Sharma', country: 'United States', username: 'asharma414', password: 'test123', dob: "1997-01-27")

vid = Video.create(title: 'test', description: 'test description', user_id: abhi.id, public: true, genre_id: entertainment.id)

vid.clip.attach(io: File.open('/Users/abhi/Development/code/Mod5/mod5-project/utube-backend/public/assets/test.mp4'), filename: 'test.mp4')
vid.thumbnail.attach(io: File.open('/Users/abhi/Development/code/Mod5/mod5-project/utube-backend/public/assets/thumbnail.jpg'), filename: 'thumbnail.jpg')

