# == Schema Information
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  title              :string           not null
#  hero_image         :string           not null
#  slug               :string           not null
#  body               :text
#  published          :boolean          default(FALSE)
#  tags               :string           default([]), is an Array
#  comments_permitted :boolean          default(TRUE)
#  category_id        :integer
#  published_at       :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  summary            :string           not null
#
# Indexes
#
#  index_articles_on_category_id   (category_id)
#  index_articles_on_published     (published)
#  index_articles_on_published_at  (published_at)
#  index_articles_on_slug          (slug)
#

class Article < ApplicationRecord
  include ArticleAdmin

  paginates_per 7

  mount_uploader :hero_image, BaseUploader

  scope :desc_order, -> { order(published_at: :desc) }
  scope :latest, -> { desc_order.first(4) }

  has_many :comments, dependent: :destroy

  belongs_to :category

  validates :title,
            :summary,
            :hero_image,
            :slug, presence: true
  validates :slug, uniqueness: true

  before_create :assign_slug

  private

  def assign_slug
    return unless title.present?
    self.slug = title.parameterize
  end
end
