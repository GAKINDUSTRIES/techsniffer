# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  percentage :integer          not null
#  admin_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_skills_on_admin_id  (admin_id)
#

class Skill < ApplicationRecord
  belongs_to :admin

  validates :name,
            :percentage,
            :admin, presence: true
end
