# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'a@a.com', password: 'aaaaaa', name: 'a')
User.create(email: 'b@b.com', password: 'bbbbbb', name: 'b')
User.create(email: 'c@c.com', password: 'cccccc', name: 'c')
Project.create(admin_id: 1, title: 'project1')
Project.create(admin_id: 2, title: 'project2')
Project.create(admin_id: 1, title: 'project3')
Project.create(admin_id: 1, title: 'project4')
Project.create(admin_id: 2, title: 'project5')
Project.create(admin_id: 3, title: 'project6')
Application.create(user_id: 3, project_id: 1)
Application.create(user_id: 3, project_id: 2)
Application.create(user_id: 3, project_id: 4)
Application.create(user_id: 2, project_id: 1)
Application.create(user_id: 2, project_id: 6)
Membership.create(user_id: 1, project_id: 2)
Membership.create(user_id: 1, project_id: 6)
Membership.create(user_id: 2, project_id: 6)