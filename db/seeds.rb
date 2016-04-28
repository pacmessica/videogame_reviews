print "Seeding standard categories..."
Game.destroy_all
Category.destroy_all
User.destroy_all


pc_games = Category.create( name:"PC Games")
xbox_games = Category.create( name:"Xbox Games")
playstation_games = Category.create( name:"Playstaion Games")
board_games = Category.create( name:"Board Games")

puts "seeded #{Category.count} categories!"

Game.create(title: "Pong", category: pc_games )
Game.create(title: "Commandos", category: pc_games)
Game.create(title: "Settlers", category: pc_games)

Game.create(title: "Splinter Cells", category: xbox_games)

Game.create(title: "Mortal Combat", category: playstation_games)

Game.create(title: "Risk", category: board_games)



10.times do
  user = User.create( email:Faker::Internet.email, password:Faker::Internet.password )
  Game.all.each do |game|
    Review.create(game:game, user:user, content:Faker::Lorem.sentence)
  end
end
