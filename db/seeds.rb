
social = Category.create(name: 'Social')
health = Category.create(name: 'Health')
intellect =  Category.create(name: 'Intellect')

user1 = User.create(email: "foo@bar.com", first_name: "Rick", last_name: "James", password: "foobarbar", password_confirmation: "foobarbar")
realchart_user1 = RealChart.create(user_id: user1.id)
act1 = Activity.create(category_id: social.id, real_chart_id: , body: "call grandma")
Interest.create(user_id: user1.id, activity_id: act1.id)
ideal1 = IdealChart.create(user_id: user1.id, health_score: 33, social_score: 30 , intellect_score: 47)
