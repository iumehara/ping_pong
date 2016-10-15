class TeamGenerator
  def self.make_pairs(tournament)
    players = tournament.players.to_a

    while players.count >= 2
      player_one = sample_and_delete(players)
      player_two = sample_and_delete(players)

      Team.create(
        name: "#{player_one.name} and #{player_two.name}",
        tournament_id: tournament.id,
        player_one_id: player_one.id,
        player_two_id: player_two.id
      )
    end
  end

  def self.sample_and_delete(array)
    random_element = array.sample
    array.delete(random_element)
    random_element
  end
end
