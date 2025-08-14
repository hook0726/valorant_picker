namespace :scraper do
  desc "Run scraping, parsing, and formatting"
  task run: :environment do
    puts "Running scrape.rb..."
    load Rails.root.join('script/scrape_vlrgg.rb')

    puts "Running parse.rb..."
    load Rails.root.join('script/match_result_parser.rb')

    puts "Running format_db.rb..."
    load Rails.root.join('script/format_compositions.rb')

    puts "All done!"
  end
end
