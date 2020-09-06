100.times do |n|
  content = Faker::Games::Pokemon.name
  Twitter.create!(content: name)                          
end
