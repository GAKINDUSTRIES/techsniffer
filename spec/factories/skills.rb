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

FactoryBot.define do
  factory :skill do
    name       { 'Ruby' }
    percentage { 95 }
    admin
  end
end
