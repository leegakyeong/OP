# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'a@a.com', password: 'aaaaaa')
User.create(email: 'b@b.com', password: 'bbbbbb')
User.create(email: 'c@c.com', password: 'cccccc')
Project.create(title: 'apple', admin_id: 1)
Project.create(title: 'banana', admin_id: 1)
Project.create(title: 'carrot', admin_id: 2)
Project.create(title: 'deer', admin_id: 2)
Project.create(title: 'electricity', admin_id: 3)
