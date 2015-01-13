class CreateSummoners < ActiveRecord::Migration
  def change
    create_table :summoners do |t|
      t.string :name
      t.integer :game_count,	:default => 0
      t.string :last_game, :default => '0'

      t.timestamps null: false
    end
  end
end
