#gemの読み込み
require 'nokogiri'
require_relative '../config/environment'

Dir.glob(Rails.root.join('tmp/match_result_html/*.html')) do |file|
  #ファイルを開く
  File.open(file) do |f|
    #ファイルの中身を読み込む
    html = f.read
    #HTMLをDOMに変換
    doc = Nokogiri::HTML.parse(html)
    #試合のタイトルを取得
    match_header = doc.at_css('div.wf-card.match-header')
    match_description = doc.at_css('div.vm-stats')

    title = match_header.css('a.match-header-event > div > div')[0].text.gsub(/\s+/, ' ').strip
    subtitle = match_header.css('a.match-header-event > div > div')[1].text.gsub(/\s+/, ' ').strip
    date  = match_header.css('div.match-header-date div')[0]&.text&.gsub(/\s+/, ' ')&.strip
    time  = match_header.css('div.match-header-date div')[1]&.text&.gsub(/\s+/, ' ')&.strip
    Time.zone = 'Asia/Tokyo'
    datetime = Time.zone.parse("#{date} #{time}")
    patch = match_header.css('div.match-header-date div')[2]&.text&.gsub(/\s+/, ' ')&.strip
    team1 = match_header.css('a.match-header-link.wf-link-hover.mod-1').text.gsub(/\s+/, ' ').strip
    team2 = match_header.css('a.match-header-link.wf-link-hover.mod-2').text.gsub(/\s+/, ' ').strip
    result = match_header.css('div.match-header-vs-score div.js-spoiler').text.gsub(/\s+/, ' ').strip
    map_names = []
    match = Match.create!(
      title: title,
      subtitle: subtitle,
      match_time: datetime,
      patch: patch,
      team1: team1,
      team2: team2,
      result: result
    )
    match_description.css('div.vm-stats-game').each do |map_section|
      map_name = map_section.css('div.map > div > span').text.gsub(/\s+/, ' ').strip.split()[0]
      p map_name
      next if map_name == '' || map_name.nil?

      map_record = Map.find_or_create_by!(name: map_name)

      MatchMap.create!(match: match, map: map_record)
      p match, map_record
      table_team1 = map_section.css('table.wf-table-inset.mod-overview')[0]
      table_team1.css('tbody > tr').each do |player_result|
        player_name = player_result.css('td.mod-player div.text-of').text.gsub(/\s+/, ' ').strip
        player_agent = player_result.css('td.mod-agents div img')[0]&.attr('title')&.gsub(/\s+/, ' ')&.strip
        match.agent_picks.create!(
          team_name: team1,
          player_name: player_name,
          agent_name: player_agent,
          map: map_record
        )
      end
      table_team2 = map_section.css('table.wf-table-inset.mod-overview')[1]
      table_team2.css('tbody > tr').each do |player_result|
        player_name = player_result.css('td.mod-player div.text-of').text.gsub(/\s+/, ' ').strip
        player_agent = player_result.css('td.mod-agents div img')[0]&.attr('title')&.gsub(/\s+/, ' ')&.strip
        match.agent_picks.create!(
          team_name: team2,
          player_name: player_name,
          agent_name: player_agent,
          map: map_record
        )
      end
    end
  end
end
