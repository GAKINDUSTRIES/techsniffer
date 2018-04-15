# == Schema Information
#
# Table name: recommendations
#
#  id                  :integer          not null, primary key
#  message             :string
#  recommendation_text :string
#  recommender_name    :string
#  relationship        :integer
#  subject             :string
#  recommendation_id   :integer          not null
#  admin_id            :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_recommendations_on_admin_id           (admin_id)
#  index_recommendations_on_recommendation_id  (recommendation_id)
#

require 'rails_helper'

describe Recommendation do
  describe 'validations' do
    subject { build :recommendation }
    it { is_expected.to validate_presence_of :recommendation_id }
    it { is_expected.to validate_uniqueness_of :recommendation_id }
    it { is_expected.to validate_presence_of :admin }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:relationship) }
  end

  describe 'associations' do
    it { is_expected.to belong_to :admin }
  end
end
