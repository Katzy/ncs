# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'randall.e.katz@gmail.com', name: 'Skip Randalberg', school: 'Milpitas', abbreviation: 'MILP', section: 'CC', cell: '415-415-4155', password: 'milp1111')

User.create(email: 'scottalankatz@gmail.com', name: 'Dip Noodlebaum', school: 'Campolindo', abbreviation: 'CAMP', section: 'NC', cell: '510-415-4155', password: 'camp1111')