class AddSummonerIdToSummoners < ActiveRecord::Migration
  def change
    add_column :summoners, :summonerID, :string
  end
end
