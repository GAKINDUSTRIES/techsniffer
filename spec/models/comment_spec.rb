# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  message    :string           not null
#  article_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  approved   :boolean          default(FALSE), not null
#
# Indexes
#
#  index_comments_on_approved    (approved)
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#

require 'rails_helper'

describe Comment do
  describe 'validations' do
    subject { build :comment }

    it { is_expected.to validate_presence_of(:message) }
    it { is_expected.to validate_presence_of(:article) }
  end

  describe 'associations' do
    it { is_expected.to belong_to :article }
    it { is_expected.to belong_to :user }
  end
end
