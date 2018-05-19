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
#  recommendation_id   :integer
#  admin_id            :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  recommender_avatar  :string
#  recommender_role    :string
#  recommender_company :string
#
# Indexes
#
#  index_recommendations_on_admin_id           (admin_id)
#  index_recommendations_on_recommendation_id  (recommendation_id)
#

class Recommendation < ApplicationRecord
  belongs_to :admin

  validates :admin, presence: true

  enum relationship: %i[
    RECOMMENDER_MANAGED_RECOMMENDEE
    RECOMMENDER_REPORTED_TO_RECOMMENDEE
    RECOMMENDER_SENIOR_THAN_RECOMMENDEE
    RECOMMENDEE_SENIOR_THAN_RECOMMENDER
    WORKED_IN_SAME_GROUP
    WORKED_IN_DIFFERENT_GROUPS
    WORKED_IN_DIFFERENT_COMPANIES
    RECOMMENDEE_IS_CLIENT_OF_RECOMMENDER
    RECOMMENDER_IS_CLIENT_OF_RECOMMENDEE
    RECOMMENDER_TAUGHT_RECOMMENDEE
    RECOMMENDER_ADVISED_RECOMMENDEE
    RECOMMENDER_STUDIED_WITH_RECOMMENDEE
  ]
end
