class Champion < ActiveRecord::Base
  belongs_to :summoner
  default_scope -> {order(games: :desc) }
end
