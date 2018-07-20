# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
    email: 'a@a.com', password: 'aaaaaa', name: 'userA', 
    institution: 'AAschool', research_interests: 'aesthetics', 
    introduction: 'Hello my name is userA')
User.create(
    email: 'b@b.com', password: 'bbbbbb', name: 'userB', 
    institution: 'BBschool', research_interests: 'bioinformatics', 
    introduction: 'Hello my name is userB')
User.create(
    email: 'c@c.com', password: 'cccccc', name: 'userC', 
    institution: 'CCschool', research_interests: 'computer science', 
    introduction: 'Hello my name is userC')

Project.create(
    title: 'apple', admin_id: 1, isKorean: true, 
    isOnline: true, maxMember: 5,
    description: 'Lorem ipsum dolor sit amet')
Project.create(
    title: 'banana', admin_id: 1, isKorean: false,
    isOnline: true, maxMember: 3,
    description: 'consectetur adipiscing elit')
Project.create(
    title: 'carrot', admin_id: 2, isKorean: true, 
    isOnline: true, maxMember: 10,
    description: 'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')
Project.create(
    title: 'deer', admin_id: 2, isKorean: false, 
    isOnline: false, maxMember: 4,
    description: 'Ut enim ad minim veniam')
Project.create(
    title: 'electricity', admin_id: 3, isKorean: true, 
    isOnline: false, maxMember: 12,
    description: 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat')

Application.create(user_id: 3, project_id: 1)
Application.create(user_id: 3, project_id: 2)
Application.create(user_id: 3, project_id: 4)
Application.create(user_id: 2, project_id: 2)
Application.create(user_id: 1, project_id: 5)
Membership.create(user_id: 1, project_id: 4)
Membership.create(user_id: 1, project_id: 3)
Membership.create(user_id: 2, project_id: 5)
Membership.create(user_id: 2, project_id: 1)
