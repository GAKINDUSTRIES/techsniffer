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
#  summary            :string           not null
#  bio                :text
#
# Indexes
#
#  index_articles_on_category_id   (category_id)
#  index_articles_on_published     (published)
#  index_articles_on_published_at  (published_at)
#  index_articles_on_slug          (slug)
#

FactoryBot.define do
  factory :article do
    title        { Faker::Lorem.unique.sentence }
    slug         { title&.parameterize }
    page_header  { Rails.root.join('spec/support/blank.jpg').open }
    body         { Faker::Lorem.paragraph }
    summary      { Faker::Lorem.paragraph }
    published_at { Faker::Date.between(2.years.ago, Date.today) }
    category
  end
end
