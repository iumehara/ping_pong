class AddTournamentIdToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :tournament_id, :integer
  end
end
