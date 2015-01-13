class Summoner < ActiveRecord::Base
	after_create :default_champ_list
	validates :name, presence: true
	has_many :champions

	def update_stats
		@summoner = self
		update_champions(@summoner)
		update_totals(@summoner)
	end

	def get_game_list
		@summoner = self
		game_list(@summoner)
	end

	private

		def default_champ_list
			names = ChampionList.first.names_and_ids
			names.each { |champ|
				self.champions.create(name: champ[:name], champID: champ[:id]) }
		end

		def usable_game_list(game_list)
			formatted = [] 
			game_list = game_list["games"]
			formatted = game_list.each { |game| formatted.push(game) }
			game_list = formatted
			formatted = []
			game_list.each { |game|		 			
				stats = {}
				stats[:invalid] = game["invalid"]
				stats[:assists] = game["stats"]["assists"] || 0
				stats[:kills] 	= game["championsKilled"] || 0
				stats[:deaths] 	= game["stats"]["numDeaths"] || 0
				stats[:win]			= game["stats"]["win"]
				stats[:gameMode]= game["gameMode"]
				stats[:champID] = game["championId"]
				stats[:createDate] = game["createDate"]
				stats[:gameID] = game["gameId"]
				formatted.push(stats) }
			formatted
		end


		def game_list(summoner)
			summoner_name = summoner.summonerID
			api_url = "https://na.api.pvp.net/api/lol/na/v1.3/game/by-summoner/#{summoner_name}/recent?api_key=#{LOL_API_KEY}"
			list = JSON.parse(RestClient.get(api_url))
			usable_game_list(list)
		end

		def update_champions(summoner)

			games = game_list(summoner)
			most_recent_game = summoner.last_game.to_i
			last_game = most_recent_game
			games.each { |game|
				puts game
				if last_game < game[:createDate]
					if game[:gameMode] == "ARAM" && !game[:invalid]
						champ = summoner.champions.find_by(champID: game[:champID])
						champ.games += 1
						game[:win] ? champ.wins += 1 : champ.losses += 1
						champ.kills += game[:kills]
						champ.deaths += game[:deaths]
						champ.assists += game[:assists]
						champ.save
					end
					if most_recent_game < game[:createDate]
						most_recent_game = game[:createDate]
					end 
					summoner.last_game = most_recent_game.to_s
				end }
			summoner.save
		end

		def update_totals(summoner)
			summoner.game_count = summoner.champions.sum(:games)
			summoner.save
		end
end
