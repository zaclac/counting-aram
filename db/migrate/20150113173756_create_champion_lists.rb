class CreateChampionLists < ActiveRecord::Migration
  def change
    create_table :champion_lists do |t|
      t.text :list

      t.timestamps null: false
    end
  end
end
