class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.integer :tournament_id
      t.string :name
      t.integer :player_one_id
      t.integer :player_two_id
      t.timestamps
    end
  end
end
