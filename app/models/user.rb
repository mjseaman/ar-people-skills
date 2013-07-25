class User < ActiveRecord::Base

	has_many :skills, through: :user_skills
	has_many :user_skills
	
  validates_uniqueness_of :email

  def proficiency_for(skill)
  	user_skill = UserSkill.where('user_id = ? and skill_id = ?',self.id,skill.id).first
  	user_skill.proficiency
  end

  def set_proficiency_for(skill,proficiency)
  	user_skill = UserSkill.where('user_id = ? and skill_id = ?',self.id,skill.id).first
  	user_skill.proficiency = proficiency
  	user_skill.save
  end

end
