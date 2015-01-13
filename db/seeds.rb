# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def make_summoner(sum_name, sum_id)
	sleep(wait)
	deeside = Summoner.new(name: sum_name, summonerID: sum_id)
	deeside.save
	deeside.update_stats
end

wait = 3

list = ChampionList.new
list.save
list.update_list

make_summoner("TheDeeSide", "23166046")
make_summoner("GarlaMapit", "26270631")
make_summoner("Jammerola", "23878413")
make_summoner("Blaklightnin", "23450012")
make_summoner("S4ND3R50N", "39025489")