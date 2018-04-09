# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  website    :string
#  message    :string           not null
#  article_id :integer          not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#

require 'rails_helper'

describe Comment do
  describe 'validations' do
    subject { build :comment }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:message) }
    it { is_expected.to validate_presence_of(:article) }
  end

  describe 'associations' do
    it { is_expected.to belong_to :article }
  end
end
