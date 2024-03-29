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
#  admin_id            :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  recommender_avatar  :string
#  recommender_role    :string
#  recommender_company :string
#
# Indexes
#
#  index_recommendations_on_admin_id  (admin_id)
#

FactoryBot.define do
  factory :recommendation do
    message             { Faker::Lorem.sentence }
    recommendation_text { Faker::Lorem.sentence }
    recommender_name    { Faker::Name.first_name }
    relationship        { 0 }
    subject             { Faker::Lorem.sentence }
    admin
  end
end
