User.destroy_all
Client.destroy_all

user1 = User.create!(email: "test@example.com", password: "password")

Client.create!(name: "藤島義明", gender: "男", age: 36, address: "東京都港区123ー456", user_id: user1.id)
Client.create!(name: "佐藤晴美", gender: "女", age: 24, address: "東京都港区123ー456", user_id: user1.id)
Client.create!(name: "縄倉 健", gender: "男", age: 18, address: "東京都港区123ー456", user_id: user1.id)
puts "初期データの投入に成功しました！"
