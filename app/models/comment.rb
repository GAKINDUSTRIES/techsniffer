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

class Comment < ApplicationRecord
  belongs_to :article

  validates :name,
            :email,
            :message,
            :article, presence: true
end
