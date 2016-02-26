# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Seeds: Job Create Start'
warrior = Job.create(name: 'Warrior')
monk = Job.create(name: 'Monk')
samurai = Job.create(name: 'Samurai')
dragoon = Job.create(name: 'Dragoon')
thief = Job.create(name: 'Thief')
ninja = Job.create(name: 'Ninja')
dark_knight = Job.create(name: 'Dark Knight')
paladin = Job.create(name: 'Paladin')
hunter = Job.create(name: 'Hunter')
berserker = Job.create(name: 'Berserker')
viking = Job.create(name: 'Viking')
mystic_knight = Job.create(name: 'Mystic Knight')
freelancer = Job.create(name: 'Freelancer')
gunner = Job.create(name: 'Gunner')
black_mage = Job.create(name: 'Black Mage')
summoner = Job.create(name: 'Summoner')
time_mage = Job.create(name: 'Time Mage')
sage = Job.create(name: 'Sage')
alchemist = Job.create(name: 'Alchemist')
red_mage = Job.create(name: 'Red Mage')
beastmaster = Job.create(name: 'Beastmaster')
dancer = Job.create(name: 'Dancer')
puppet_master = Job.create(name: 'Puppet Master')
puts 'Seeds: Job Create Finished'
