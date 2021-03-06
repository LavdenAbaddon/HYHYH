# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_array = []                                                         
(1..250).each do |num|                                                       
  user_array << User.create!(username: "User"+num.to_s, password: "password"+num.to_s, room_id: num)                 
end 

user_array_join = []
(251..500).each do |num|
  prng = Random.new
  room = prng.rand(250..350)
  user_array_join << User.create!(username: "User"+num.to_s, password: "password"+num.to_s, room_id: room - 249)
end

room_array = []
(user_array).each do |user|
  if user.id <= 125
    randName = SecureRandom.hex(5)
    room_array << Room.create!(host_id: user.id, room_name: user.username+"'s Room", link_1: "https://www.youtube.com/watch?v=" + randName.to_s + user.id.to_s, link_2: "https://www.youtube.com/watch?v=" + randName.to_s + user.id.to_s)
  elsif user.id > 125 && user.id < 240
    room_array << Room.create!(host_id: user.id, room_name: user.username+"'s Room", link_1: "https://www.youtube.com/watch?v=kJQP7kiw5Fk")
  else
    room_array << Room.create!(host_id: user.id, room_name: user.username+"'s Room", link_1: "https://www.youtube.com/watch?v=g-N3s4sBlvs")
  end
end

Playlist.create!(link: "https://www.youtube.com/watch?v=kJQP7kiw5Fk", title: "Most Popular link", count:1 )
Playlist.create!(link: "https://www.youtube.com/watch?v=g-N3s4sBlvs", title: "Second Popular link", count:1 )
(room_array).each do |room|
  if room.id <= 125
    Playlist.create!(link: room.link_1, title: "testlink in " + room.id.to_s, count:1 )
    Playlist.create!(link: room.link_2, title: "testlink2 in " + room.id.to_s, count:1 )
  elsif room.id > 125 && room.id < 240
    Playlist.find_by_link("https://www.youtube.com/watch?v=kJQP7kiw5Fk").increment!(:count)
  else
    Playlist.find_by_link("https://www.youtube.com/watch?v=g-N3s4sBlvs").increment!(:count)
  end
end


(room_array).each do |room|
  ActiveUser.create!(room_id: room.id, user_count: 1)
end
(user_array_join).each do |user_join|
  ActiveUser.find_by_room_id(user_join.room_id).increment!(:user_count)
end




