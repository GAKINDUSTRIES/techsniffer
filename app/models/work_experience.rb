# == Schema Information
#
# Table name: work_experiences
#
#  id          :integer          not null, primary key
#  start_at    :date             not null
#  end_at      :date
#  company     :string           not null
#  position    :string           not null
#  description :string           not null
#  admin_id    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_work_experiences_on_admin_id  (admin_id)
#

class WorkExperience < ApplicationRecord
  include WorkExperienceAdmin

  default_scope -> { order(:start_at) }

  belongs_to :admin

  validates :start_at,
            :company,
            :position,
            :description,
            :admin, presence: true
end
