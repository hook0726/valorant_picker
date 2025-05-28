class TeamBuildsController < ApplicationController
  def index
    @maps = Map.all
    @players = current_user.players
  end

  def search
    map_id = params[:map_id]
    player_ids = params[:player_ids].reject(&:blank?)
    p map_id
    p player_ids
    if player_ids.size != 5
      flash.now[:alert] = "プレイヤーを5人選んでください"
      @maps = Map.all.order(:name)
      @players = current_user.players
      return render :index
    end

    @map = Map.find(map_id)
    @players = Player.where(id: player_ids)
    agent_id_lists = @players.map do |player|
      player.available_agents.pluck(:agent_id)
    end
    p agent_id_lists


    results = TeamBuilderService.new(agent_id_lists, @map).call
    p results
    if results.any?
      result = results.sample
      @suggested_composition = result[:team_composition]
      @agent_assignments = result[:assignment]
    else
      @suggested_composition = nil
    end

    @maps = Map.all.order(:name)
    @players = current_user.players
    render :index
  end
end
