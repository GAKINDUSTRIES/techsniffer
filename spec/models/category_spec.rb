# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

describe Category do
  describe 'validations' do
    subject { build :category }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to validate_presence_of :name }
  end

  describe 'associations' do
    it { is_expected.to have_many(:articles).dependent(:destroy) }
  end
end
