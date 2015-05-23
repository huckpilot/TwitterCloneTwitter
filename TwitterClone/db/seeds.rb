# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email:"huckpilot@gmail.com", username:"huckpilot", password: "testpassword")
User.create(email:"underminingAuthJk@gmail.com", username:"underminingAuthJk", password: "testpassword")
User.create(email:"whatsTheDeal@that.com", username:"whatsTheDeal", password: "testpassword")
User.create(email:"stoneMountainGoat@peak.com", username:"BillsHill", password: "testpassword")

Tweet.create(user_id: 1, content: "Curabitur rutrum volutpat urna id fringilla. Ut velit orci, aliquet at tempor at, molestie eget dolor. Cras dapibus aliquam lectus, nec tempor lacus.")
Tweet.create(user_id: 2, content: "In hac habitasse platea dictumst. Aliquam a bibendum purus. Pellentesque non congue ex, et ultricies leo. Vivamus ac hendrerit velit, nec facilisis arcu. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non interdum nisi.")
Tweet.create(user_id: 4, content: "Morbi sollicitudin arcu et suscipit pretium. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum sit amet varius sapien, vitae gravida lorem.")
Tweet.create(user_id: 3, content: "Nunc volutpat, lacus ut feugiat porta, quam tellus luctus odio, in dapibus nulla est et tellus. Curabitur tristique ipsum tellus, in ultrices dolor accumsan sed.")
Tweet.create(user_id: 2, content: "ivamus turpis risus, tincidunt eu nulla id, aliquet sollicitudin elit. Fusce convallis massa at tortor suscipit, quis interdum justo volutpat. Duis egestas nisi est, et rutrum nulla egestas sit amet. Donec placerat et ligula at viverra.")

Relationship.create(follower_id: 1, followed_id: 2, blocked: false)
Relationship.create(follower_id: 3, followed_id: 4, blocked: true)
Relationship.create(follower_id: 1, followed_id: 3, blocked: false)