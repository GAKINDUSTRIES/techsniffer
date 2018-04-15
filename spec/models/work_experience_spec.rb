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

require 'rails_helper'

describe WorkExperience do
  describe 'validations' do
    subject { build :work_experience }
    it { should validate_presence_of :start_at }
    it { should validate_presence_of :company }
    it { should validate_presence_of :position }
    it { should validate_presence_of :description }
    it { should validate_presence_of :admin }
  end

  describe 'Associations' do
    it { should belong_to :admin }
  end
end
