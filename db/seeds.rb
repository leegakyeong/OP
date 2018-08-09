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
    skills: 'programming, reading, writing', tools: 'github, slack',
    description: 'Lorem ipsum dolor sit amet')
Project.create(
    title: 'banana', admin_id: 1, isKorean: false,
    isOnline: true, maxMember: 3,
    skills: 'speaking, listening, english', tools: 'github, git kraken',
    description: 'consectetur adipiscing elit')
Project.create(
    title: 'carrot', admin_id: 2, isKorean: true, 
    isOnline: true, maxMember: 10, isClosed: true,
    skills: 'public speaking, writing, c programming', tools: 'r studio, vs code, github, trello',
    description: 'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')
Project.create(
    title: 'deer', admin_id: 2, isKorean: false, 
    isOnline: false, maxMember: 4,
    skills: 'programming, coding, web design', tools: 'zeplin, youtube, workflowy, bugs',
    description: 'Ut enim ad minim veniam')
Project.create(
    title: 'electricity', admin_id: 3, isKorean: true, 
    isOnline: false, maxMember: 12,
    skills: 'data science, statistics, applied maths', tools: 'ubuntu, slack, atom',
    description: 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',)
Project.create(
    title: 'fairy', admin_id: 3, isKorean: false, 
    isOnline: false, maxMember: 2,
    skills: 'c++, c, java, javascript, python, r', tools: 'powerpoint, latex, git',
    description: 'apple banana carrot deer electricity fairy')

Project.find(1).tags << Tag.create(project_id: 1, content: "tag1")
Project.find(1).tags << Tag.create(project_id: 1, content: "tag2")
Project.find(1).tags << Tag.create(project_id: 1, content: "tag3")
Project.find(1).tags << Tag.create(project_id: 1, content: "tag4")
Project.find(1).tags << Tag.create(project_id: 1, content: "deer?")
Project.find(2).tags << Tag.create(project_id: 2, content: "what")
Project.find(2).tags << Tag.create(project_id: 2, content: "github")
Project.find(2).tags << Tag.create(project_id: 2, content: "IAmuserA")
Project.find(3).tags << Tag.create(project_id: 3, content: "IAmuserA")
Project.find(3).tags << Tag.create(project_id: 3, content: "programming")
Project.find(3).tags << Tag.create(project_id: 3, content: "c programming")
Project.find(3).tags << Tag.create(project_id: 3, content: "yes")
Project.find(4).tags << Tag.create(project_id: 4, content: "deer")
Project.find(4).tags << Tag.create(project_id: 4, content: "this is a deer project")
Project.find(4).tags << Tag.create(project_id: 4, content: "apple")
Project.find(5).tags << Tag.create(project_id: 5, content: "electric shock")
Project.find(5).tags << Tag.create(project_id: 5, content: "electricity")
Project.find(5).tags << Tag.create(project_id: 5, content: "electrical engineering")
Project.find(6).tags << Tag.create(project_id: 6, content: "fairy tale")
Project.find(6).tags << Tag.create(project_id: 6, content: "tinker bell")
Project.find(6).tags << Tag.create(project_id: 6, content: "peter pan")

Application.create(user_id: 3, project_id: 1)
Application.create(user_id: 3, project_id: 2)
Application.create(user_id: 3, project_id: 4)
Application.create(user_id: 2, project_id: 2)
Application.create(user_id: 1, project_id: 5)
Membership.create(user_id: 1, project_id: 4)
Membership.create(user_id: 1, project_id: 3)
Membership.create(user_id: 2, project_id: 5)
Membership.create(user_id: 2, project_id: 1)
ProjectLike.create(user_id: 1, project_id: 1)
ProjectLike.create(user_id: 1, project_id: 2)
ProjectLike.create(user_id: 2, project_id: 1)
ProjectLike.create(user_id: 3, project_id: 1)
ProjectLike.create(user_id: 3, project_id: 2)

