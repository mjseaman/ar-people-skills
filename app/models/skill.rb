class Skill < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :users, through: :user_skills
  has_many :user_skills

  def user_with_proficiency(proficiency)
  	UserSkill.where('skill_id = ? and proficiency = ?',self.id,proficiency).first.user
  end
end

