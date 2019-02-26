require 'faker'

p 'Creating users...'
User.create!(
  email: 'user@example.com',
  password: 'userexample11',
  confirmed_at: Time.now,
) unless User.find_by(email: 'user@example.com')

20.times do
  User.create!(
    name: Faker::FunnyName.three_word_name,
    email: Faker::Internet.email,
    confirmed_at: Time.now,
    password: 'defaultpass11'
  )
end

p 'Creating genres...'
%w(Action Comedy Sci-Fi War Crime
   Horror Sport Western Drama
   Musicial Romance Thriller
).each do |genre|
  Genre.find_or_create_by!(name: genre)
end

p 'Creating movies...'
genre_ids = Genre.pluck(:id)
if Movie.count < 100
  20.times do
    Movie.create!(
      title: Faker::Movies::HarryPotter.book,
      description: Faker::Movies::HarryPotter.quote,
      genre_id: genre_ids.sample,
      released_at: Date.new(rand(1920..2015))
    )
  end
  20.times do
    Movie.create!(
        title: Faker::Movies::StarWars.character,
        description: Faker::Movies::StarWars.quote,
        genre_id: genre_ids.sample,
        released_at: Date.new(rand(1920..2015))
    )
  end
  20.times do
    Movie.create!(
        title: Faker::Movies::LordOfTheRings.character,
        description: Faker::Movies::LordOfTheRings.location,
        genre_id: genre_ids.sample,
        released_at: Date.new(rand(1920..2015))
    )
  end
end

p 'Creating comments...'

User.all.each do |user|
  Movie.all.each do |movie|
    FactoryBot.create(:comment, user_id: user.id, movie_id: movie.id) if rand < 0.6
  end
end
