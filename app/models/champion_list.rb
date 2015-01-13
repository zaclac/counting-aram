class ChampionList < ActiveRecord::Base
	require 'rest-client'
	require 'json'
	require 'uri'
	
	serialize :list

	def names_and_ids
		temp_list = self.list
		temp_list = temp_list["data"]
		names = []

		temp_list.each_value { |champ| 
			names << { :name =>champ["key"], :id => champ["id"] } }
		names
	end

	def update_list
		self.list = JSON.parse(RestClient.get("https://na.api.pvp.net/api/lol/static-data/na/v1.2/champion?api_key=#{LOL_API_KEY}"))
		self.save
	end

end
