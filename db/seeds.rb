puts "seedの実行を開始"

Admin.find_or_create_by!(email: "kuri@g") do |admin|
  admin.email = "kuri@g",
  admin.password = "aaaaaa"
end


Leader.find_or_create_by!(email: "tomo@g") do |leader|
 leader.email = "tomo@g"
 leader.password = "bbbbbb"
 leader.name = "tomo"
end

Leader.find_or_create_by!(email: "ai@g") do |leader|
  leader.email = "ai@g"
  leader.password = "cccccc"
  leader.name = "ai"
end

puts "seedの実行が完了しました"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
