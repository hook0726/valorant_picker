class TeamBuilderService
  def initialize(agents, map)
    @agent_id_lists = agents # [[1,2,3], [4,5,6], ...]
    @map = map               # Mapオブジェクト
  end

  def call
    matched = []
    TeamComposition.includes(:composition_picks).where(map_id: @map.id).select do |tc|
      pick_ids = tc.composition_picks.map(&:agent_id)
      pick_ids.permutation.any? do |perm|
        assignment = []
        valid = perm.each_with_index.all? do |agent_id, i|
          if @agent_id_lists[i].include?(agent_id)
            assignment[i] = agent_id
            true
          else
            false
          end
        end
        if valid
          # 割り当てと構成のペアを保存
          matched << { team_composition: tc, assignment: assignment }
          break
        end
      end
    end
    matched
  end
end
