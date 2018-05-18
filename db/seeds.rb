# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
  i += 1
  user = User.create(
    name: i,
    email: "user#{i}@example.com",
    password_digest: 'password'
  )

  3.times do |j|
    j += 1
    Micropost.create(
      content: "#{user.email}のPost その#{j}",
      user_id: user.id
    )

    Like.create(user_id: i, micropost_id: j)
  end
end