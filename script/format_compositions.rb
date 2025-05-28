require_relative '../config/environment'

Match.includes(:agent_picks).find_each do |match|
  match.agent_picks.group_by { |ap| [ap.map, ap.team_name] }.each do |(map, team_name), picks|
    next if map.nil? || team_name.nil?
    next if picks.size != 5

    team_comp = TeamComposition.find_or_create_by!(
      match: match,
      map: map,
      team_name: team_name
    )

    picks.each do |pick|
      agent = Agent.find_or_create_by!(name: pick.agent_name)
      team_comp.composition_picks.create!(
        agent: agent,
        player_name: pick.player_name
      )
    end
  end
end
