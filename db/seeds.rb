


User.delete_all

User.create! username: "ecarralt", password: "12345678"

Post.delete_all

post_titles = [
    "This is my first post!",
    "This is my second post!",
    "I don't know what else to say in this 3rd post!"
]

post_titles.each do |title|
  newpost = Post.new
  newpost.title = title
  if newpost.save
    puts "Created Post: #{newpost.id}"
  else
    puts "Did not create post with title: #{newpost.title}"

  end
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
