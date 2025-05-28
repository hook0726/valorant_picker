# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Agent.find_or_create_by([
  { id: 1,  name: "Brimstone", role: "Controller", image_url: "brimstone.png" },
  { id: 2,  name: "Viper", role: "Controller", image_url: "viper.png" },
  { id: 3,  name: "Omen", role: "Controller", image_url: "omen.png" },
  { id: 4,  name: "Killjoy", role: "Sentinel", image_url: "killjoy.png" },
  { id: 5,  name: "Cypher", role: "Sentinel", image_url: "cypher.png" },
  { id: 6,  name: "Sova", role: "Initiator", image_url: "sova.png" },
  { id: 7,  name: "Sage", role: "Sentinel", image_url: "sage.png" },
  { id: 9,  name: "Phoenix", role: "Duelist", image_url: "phoenix.png" },
  { id: 10, name: "Jett", role: "Duelist", image_url: "jett.png" },
  { id: 11, name: "Reyna", role: "Duelist", image_url: "reyna.png" },
  { id: 12, name: "Raze", role: "Duelist", image_url: "raze.png" },
  { id: 13, name: "Breach", role: "Initiator", image_url: "breach.png" },
  { id: 14, name: "Skye", role: "Initiator", image_url: "skye.png" },
  { id: 15, name: "Yoru", role: "Duelist", image_url: "yoru.png" },
  { id: 16, name: "Astra", role: "Controller", image_url: "astra.png" },
  { id: 17, name: "Kayo", role: "Initiator", image_url: "kayo.png" },
  { id: 18, name: "Chamber", role: "Sentinel", image_url: "chamber.png" },
  { id: 19, name: "Neon", role: "Duelist", image_url: "neon.png" },
  { id: 20, name: "Fade", role: "Initiator", image_url: "fade.png" },
  { id: 21, name: "Harbor", role: "Controller", image_url: "harbor.png" },
  { id: 22, name: "Gekko", role: "Initiator", image_url: "gekko.png" },
  { id: 23, name: "Deadlock", role: "Sentinel", image_url: "deadlock.png" },
  { id: 24, name: "Iso", role: "Duelist", image_url: "iso.png" },
  { id: 25, name: "Clove", role: "Controller", image_url: "clove.png" },
  { id: 26, name: "Vyse", role: "Sentinel", image_url: "vyse.png" },
  { id: 27, name: "Tejo", role: "Initiator", image_url: "tejo.png" },
  { id: 28, name: "Waylay", role: "Duelist", image_url: "waylay.png" }
])

["Ascent", "Bind", "Haven", "Split", "Pearl", "Lotus", "Icebox", "Breeze", "Sunset", "Fracture", "Abyss"].each do |map_name|
  Map.find_or_create_by(name: map_name)
end