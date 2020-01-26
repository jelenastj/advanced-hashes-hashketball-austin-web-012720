require 'pry'

def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
            colors: %w[Turquoise Purple],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
                  ] },
    home: { team_name: 'Brooklyn Nets',
      colors: %w[Black White],
      players: [
        { player_name: 'Alan Anderson',
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 },
        { player_name: 'Reggie Evans',
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7 },
        { player_name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 },
        { player_name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5 },
        { player_name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1 }
      ] }
  }
end

def num_points_scored(player_n)
  #all_players = get_all_players(game_hash)
  game_hash.each do |all_players, keys|
    keys[:players].each do |player|
      return player[:points] if player[:player_name] == player_n
    end
  end
end


def get_all_players (game_hash)
    game_hash[:home][:players].concat(game_hash[:away][:players])
end

def shoe_size (name)
  game_hash.each do |all_players, keys|
    keys[:players].each do |player|
      return player[:shoe] if player[:player_name] == name
    end
  end
end

def team_colors (team)
  if team == 'Brooklyn Nets'
    return game_hash[:home][:colors]
  else return game_hash[:away][:colors]
  end
end

def team_names 
  game_hash.map do |team, team_info|
    team_info [:team_name]
  end
end
 
def player_numbers(team_n)
  jersey = []
  game_hash.each do |team, team_info|
    if team_n == team_info [:team_name]
  team_info.each do |key, value|
        if key == :players 
          value.each do |player|
            jersey.push(player[:number])
          end
        end
      end
    end
 end 
 return jersey
end

def player_stats (player_n)
 new_hash = {}
 game_hash.each do |team, team_name|
   team_name.each do |attribute, data|
     if attribute == :players
       data.each do |player|
         if player[:player_name] == player_n
           new_hash = player.delete_if do |k, v|
           k == :player_name
          end
         end
        end
      end
    end 
  end
    return new_hash
end


def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:shoe] > big_shoe
        big_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end

def most_points_scored
  most_points = 0
  the_player = ''
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      if player[:points] > most_points
       most_points  = player[:points] 
        the_player = player[:player_name]
      end
    end
  end
  return the_player
end


def winning_team
  total_points = 0
  win_team = ''
  game_hash.each do |home_away, keys|
    team_points = 0
    team_name = game_hash[home_away][:team_name]
    keys[:players].each do |player|
      points = player[:points]
      team_points += points
    end
    win_team, total_points = team_name, team_points if team_points > total_points
  end
  return win_team
end

def player_with_longest_name
  longest = ''
  longest_length = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      name_length = player[:player_name].length
      longest, longest_length = player[:player_name], name_length if name_length > longest_length
    end
  end
  return longest
end


# Super Bonus

def long_name_steals_a_ton?
  steals_most = ''
  most_steals = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      steals_most, most_steals = player[:player_name], player[:steals] if player[:steals] > most_steals
    end
  end
  return true if steals_most == player_with_longest_name
end




