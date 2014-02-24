categories = []
categories << Category.create(name: 'Social')
categories << Category.create(name: 'Health')
categories << Category.create(name: 'Intellect')

User.create(email: "foo@bar.com", first_name: "Rick", last_name: "James", password:"foobar", password_confirmation: "foobar")