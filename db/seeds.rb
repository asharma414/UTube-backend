Comment.destroy_all
Genre.destroy_all
User.destroy_all
Video.destroy_all
View.destroy_all
Like.destroy_all
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

abhi = User.create(first_name: 'Abhinav', last_name: 'Sharma', country: 'United States', username: 'asharma414', password: 'test123', dob: "1997-01-27", uplooader: true)

# vid = Video.new(title: 'test', description: 'test description', user_id: abhi.id, public: true, genre_id: entertainment.id)

# vid.clip.attach(io: File.open('../public/assets/test.mp4'), filename: 'test.mp4')
# vid.thumbnail.attach(io: File.open('../public/assets/thumbnail.jpg'), filename: 'thumbnail.jpg')

# vid.save