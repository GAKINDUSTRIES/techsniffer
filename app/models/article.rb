# == Schema Information
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  title              :string           not null
#  page_header        :string           not null
#  slug               :string           not null
#  body               :string
#  published          :boolean          default(FALSE)
#  tags               :string           default([]), is an Array
#  comments_permitted :boolean          default(TRUE)
#  category_id        :integer
#  published_at       :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_published    (published)
#  index_articles_on_slug         (slug)
#

class Article < ApplicationRecord
  validates :title, presence: true
  validates :page_header, presence: true
  validates :slug, presence: true, uniqueness: true

  has_many :comments, dependent: :destroy
  belongs_to :category

  before_create :assign_slug

  private

  def assign_slug
    return unless title.present?
    self.slug = title.parameterize
  end
end
