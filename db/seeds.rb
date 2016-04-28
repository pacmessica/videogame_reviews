print "Seeding standard categories..."

Category.create([
  { name:"PC Games"},
  { name:"Xbox Games" },
  { name:"Playstation Games"},
  { name: "Wii Games" }
  ])

  puts "seeded #{Category.count} categories!"
