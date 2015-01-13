namespace :scheduler do

	desc "This task is called by the Heroku scheduler add-on"
	task :update_summoners => :environment do
  	puts "Updating summoners..."
  	Summoners.all.each { |summoner| 
  		sleep(2)
  		puts "#{summoner.name}..."
  		summoner.update_stats }
  	puts "done."
	end

	task :update_champion_list => :environment do
  	ChampionList.first.update_list
	end

end