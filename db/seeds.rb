# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

trevor = Mechanic.create(name: "Trevor Suter", years_experience: 2)
jack = Mechanic.create(name: "Jack Berry", years_experience: 10)
seth = Mechanic.create(name: "Seth Bevill", years_experience: 5)
brian = Mechanic.create(name: "Brian Hinks", years_experience: 7)

ride1 = Ride.create(name: "Roller Coaster", thrill_rating: 10)
ride2 = Ride.create(name: "Tea Cups", thrill_rating: 7)
ride3 = Ride.create(name: "Basketball", thrill_rating: 4)
ride4 = Ride.create(name: "Bouncy Castle", thrill_rating: 1)

RideMechanic.create(ride: ride1, mechanic: trevor)
RideMechanic.create(ride: ride1, mechanic: jack)
RideMechanic.create(ride: ride2, mechanic: jack)
RideMechanic.create(ride: ride2, mechanic: seth)
RideMechanic.create(ride: ride3, mechanic: seth)
RideMechanic.create(ride: ride3, mechanic: brian)
RideMechanic.create(ride: ride3, mechanic: jack)
RideMechanic.create(ride: ride4, mechanic: brian)
RideMechanic.create(ride: ride4, mechanic: trevor)


