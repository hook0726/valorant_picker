class PlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_player, only: [:edit, :update, :destroy]
  def index
    @players = current_user.players
  end

  def new
    @player = current_user.players.new
  end

  def create
    puts params.inspect
    @player = current_user.players.new(name: player_params[:name])

    if @player.save
      # 選ばれたAgentのIDだけを登録
      selected_ids = player_params[:agent_ids].reject(&:blank?)
      selected_ids.each do |agent_id|
        @player.available_agents.create(agent_id: agent_id)
      end

      redirect_to players_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @player.update(player_params)
        redirect_to players_path, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy
    redirect_to players_path, notice: "削除しました"
  end
  private
    def set_player
      @player = current_user.players.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:name, agent_ids: [])
    end
end
