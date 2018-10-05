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

require 'rails_helper'

describe Skill do
  describe 'associations' do
    it { is_expected.to belong_to :admin }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :percentage }
    it { is_expected.to validate_presence_of :admin }
  end
end
