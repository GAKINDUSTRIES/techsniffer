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

FactoryBot.define do
  factory :comment do
    message { Faker::Lorem.sentence }
    article
    user
  end
end
