require 'faker'

# create a few users
User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com'
5.times do
  User.create :name => Faker::Name.name, :email => Faker::Internet.email
end

# create a few technical skills
computer_skills = %w(Ruby Sinatra Rails JavaScript jQuery HTML CSS)
computer_skills.each do |skill|
  Skill.create :name => skill, :context => 'technical'
end

# create a few creative skills
design_skills = %w(Photoshop Illustrator Responsive-Design)
design_skills.each do |skill|
  Skill.create :name => skill, :context => 'creative'
end

# TODO: create associations between users and skills
users = User.all
skills = Skill.all

100.times do
	users.sample.user_skills << UserSkill.create(
		skill:skills.sample,
		proficiency:rand(50)+50)
	# UserSkill.create(
	# 	user: users.sample,
	# 	skill: skills.sample,
	# 	proficiency:rand(50)+50)
end