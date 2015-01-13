class CreateChampions < ActiveRecord::Migration
  def change
    create_table :champions do |t|
      t.string :name
      t.integer :champID
      t.integer :games,                 :default => 0
      t.integer :wins,                  :default => 0
      t.integer :losses,                :default => 0
      t.integer :kills,                 :default => 0
      t.integer :deaths,                :default => 0
      t.integer :assists,               :default => 0
      t.integer :pentakills,            :default => 0
      t.integer :quadrakills,           :default => 0
      t.integer :double_kills,          :default => 0
      t.integer :triple_kills,          :default => 0
      t.integer :largest_killing_spree, :default => 0
      t.integer :killing_sprees,        :default => 0
      t.references :summoner, index: true

      t.timestamps null: false
    end
    add_foreign_key :champions, :summoners
  end
end
