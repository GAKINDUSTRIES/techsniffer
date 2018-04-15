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

FactoryBot.define do
  factory :comment do
    name    { Faker::Name.name }
    email   { Faker::Internet.email }
    website { Faker::Internet.url }
    message { Faker::Lorem.sentence }
    article
  end
end